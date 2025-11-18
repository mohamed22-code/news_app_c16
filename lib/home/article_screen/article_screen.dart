import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app_c16/design/app_styles.dart';
import 'package:news_app_c16/model/NewsResponse.dart';

import '../../design/app_colors.dart';

class ArticleDetails extends StatefulWidget {
  const ArticleDetails({super.key, required this.newsItem});

  final News newsItem;

  @override
  State<ArticleDetails> createState() => _ArticleDetailsState();
}

class _ArticleDetailsState extends State<ArticleDetails> {
  @override
  Widget build(BuildContext context) {
    print(widget.newsItem.content??"");
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: AppColors.blackColor
        ),
        backgroundColor: AppColors.whiteColor,
        leading: IconButton(
              icon: Icon(Icons.menu, color: AppColors.blackColor),
              onPressed: () {
                Navigator.pop(context);
              },
      ),),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16 ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 26),
              Text(widget.newsItem.title ?? "",
                style: AppStyles.bold24Black,),
              SizedBox(height: 26),

              Text(widget.newsItem.description ?? "",
                  style: AppStyles.medium14Black,),
              SizedBox(height: 26),

              Text("By ${widget.newsItem.author ?? ""}",style: AppStyles.medium12grey,),
              SizedBox(height: 26),

              Text(widget.newsItem.publishedAt ?? "",style: AppStyles.medium12grey,),
              SizedBox(height: 26),

              CachedNetworkImage(
                imageUrl: widget.newsItem.urlToImage ?? '',
                placeholder: (context, url) => Center(
                  child: CircularProgressIndicator(color: AppColors.greyColor),
                ),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),

              SizedBox(height: 26),

              Text(widget.newsItem.content ?? "",style: AppStyles.bold16Black,),
              SizedBox(height: 26),

            ],
          ),
        ),
      ),

    );
  }
}
