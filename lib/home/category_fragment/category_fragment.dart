import 'package:flutter/material.dart';
import 'package:news_app_c16/home/category_fragment/category_item.dart';
import 'package:news_app_c16/l10n/app_localizations.dart';
import 'package:news_app_c16/model/category.dart';
import 'package:provider/provider.dart';

import '../../core/Providers/theme_provider.dart';

typedef OnCategoryItemClick = void Function(Category);

class CategoryFragment extends StatelessWidget {
  OnCategoryItemClick onCategoryItemClick;
   CategoryFragment({super.key,required this.onCategoryItemClick});
  List<Category> categoriesList = [];

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    bool isDark = Provider.of<ThemeProvider>(context).isDark;
    categoriesList = Category.getCategoryList(context, isDark);
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: width*0.04,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(AppLocalizations.of(context)!.description_home_screen,
          style: Theme.of(context).textTheme.headlineMedium,),
          Expanded(child: ListView.separated(
            padding: EdgeInsets.only(
              top: height*0.02
            ),
              itemBuilder: (context, index) {
                return InkWell(
                    onTap: () {
                      onCategoryItemClick(categoriesList[index]);
                    },
                    child: CategoryItem(category: categoriesList[index],index: index,));
              },
              separatorBuilder: (context, index) {
                return SizedBox(height: height*0.02,);
              },
              itemCount: categoriesList.length))
        ],
      ),
    );
  }
}
