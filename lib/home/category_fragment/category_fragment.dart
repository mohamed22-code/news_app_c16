import 'package:flutter/material.dart';
import 'package:news_app_c16/home/category_fragment/category_item.dart';
import 'package:news_app_c16/model/category.dart';

class CategoryFragment extends StatelessWidget {
   CategoryFragment({super.key});
  List<Category> categoriesList = [];

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    categoriesList = Category.getCategoryList(true);
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: width*0.04,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Good Morning\nHere is Some News For You',
          style: Theme.of(context).textTheme.headlineMedium,),
          Expanded(child: ListView.separated(
            padding: EdgeInsets.only(
              top: height*0.02
            ),
              itemBuilder: (context, index) {
                return CategoryItem(category: categoriesList[index]);
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
