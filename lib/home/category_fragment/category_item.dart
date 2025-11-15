import 'package:flutter/material.dart';
import 'package:news_app_c16/design/app_colors.dart';
import 'package:news_app_c16/model/category.dart';

class CategoryItem extends StatelessWidget {
  final Category category;
  final int index;
  const CategoryItem({super.key,required this.category,required this.index});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    bool isEven = (index % 2 == 0);
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: BorderRadiusGeometry.circular(24)
      ),
      child: Stack(
        alignment: (isEven)?Alignment.bottomRight:Alignment.bottomLeft,
        children: [
          Image.asset(category.image),
          Column(
            children: [
              Text(category.title,
                style: Theme.of(context).textTheme.headlineLarge?.copyWith(color: AppColors.blackColor),),
              SizedBox(height: height*0.04,),
              Container(
                width: width*0.40,
                margin: EdgeInsets.symmetric(
                  horizontal: width*0.04,
                  vertical: height*0.02
                ),
                padding: EdgeInsetsDirectional.only(
                  start: (isEven)? width*0.02:0,
                  end: (isEven)? 0:width*0.02,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(84),
                  color: AppColors.greyColor,
                ),

                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  textDirection: (isEven)?TextDirection.ltr:TextDirection.rtl,
                  children: [
                    Text('View All',
                    style: Theme.of(context).textTheme.headlineMedium,),
                    CircleAvatar(
                      radius: 25,
                      backgroundColor: Theme.of(context).primaryColor,
                      child: Icon((isEven)?Icons.arrow_forward_ios_outlined:
                        Icons.arrow_back_ios_outlined,size: 35,
                      color: Theme.of(context).splashColor,),
                    )
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
