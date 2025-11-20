import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app_c16/core/extensions/data_formatis_extension.dart';
import 'package:news_app_c16/home/article_screen/article_screen.dart';
import 'package:news_app_c16/l10n/app_localizations.dart';
import 'package:news_app_c16/model/NewsResponse.dart';

import '../../core/design/app_colors.dart';
import '../../core/design/app_styles.dart';

class NewsItem extends StatelessWidget {
  final News news;

  const NewsItem({super.key, required this.news});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: width * 0.02,
        vertical: height * 0.02,
      ),
      margin: EdgeInsets.symmetric(horizontal: width * 0.04),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Theme.of(context).splashColor, width: 2),
      ),
      child: InkWell(
        onTap: () {
          _showBottomSheet(context);
        },
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadiusGeometry.circular(8),
              child: CachedNetworkImage(
                imageUrl: news.urlToImage ?? '',
                placeholder: (context, url) => Center(
                  child: CircularProgressIndicator(color: AppColors.greyColor),
                ),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            ),
            SizedBox(height: height * 0.02),
            Text(
              news.title ?? '',
              style: Theme.of(context).textTheme.labelLarge,
            ),
            SizedBox(height: height * 0.02),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    'By ${news.author ?? ''}',
                    style: AppStyles.medium12grey,
                  ),
                ),
                Text(news.publishedAt?.formatArticleDate() ?? "", style: AppStyles.medium12grey),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      backgroundColor: Theme.of(context).splashColor,
      context: context,
      builder: (context) {
        return Container(
          padding: EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 10,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 10),
              ClipRRect(
                borderRadius: BorderRadiusGeometry.circular(16),
                child: CachedNetworkImage(
                  imageUrl: news.urlToImage ?? '',
                  placeholder: (context, url) => Center(
                    child: CircularProgressIndicator(color: AppColors.greyColor),
                  ),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
              ),
              SizedBox(height: 25),
              Text(news.content ?? "",
                style: Theme.of(context).textTheme.bodyMedium),
              Expanded(child: SizedBox()),
            ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ArticleDetails(newsItem: news),
                      ),
                    );
                  },
                  child: Text(AppLocalizations.of(context)!.button_text,style: Theme.of(context).textTheme.labelLarge,),
                ),
              SizedBox(height: 30),
            ],
          ),
        );
      },
    );
  }
}
