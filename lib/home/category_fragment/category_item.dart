import 'package:flutter/material.dart';
import 'package:news_app_c16/model/category.dart';

class CategoryItem extends StatelessWidget {
  final Category category;
  const CategoryItem({super.key,required this.category});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: BorderRadiusGeometry.circular(24)
      ),
      child: Stack(
        children: [
          Image.asset(category.image),
          Positioned(
            height: height*0.06,

            child: Text(category.title,
            style: Theme.of(context).textTheme.headlineLarge?.copyWith(color: Colors.black)),
          )
        ],
      ),
    );
  }
}
