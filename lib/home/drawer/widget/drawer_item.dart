import 'package:flutter/material.dart';
import 'package:news_app_c16/design/app_colors.dart';
import 'package:news_app_c16/design/app_styles.dart';

class DrawerItem extends StatelessWidget {
  final IconData iconName;
  final String text;
  const DrawerItem({super.key,required this.iconName,required this.text});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: width*0.04,
        vertical: height*0.02
      ),
      child: Row(
        children: [
          Icon(iconName,color: AppColors.whiteColor,),
          SizedBox(width: 10,),
          Text(text,style: AppStyles.bold20White,),
        ],
      ),
    );
  }
}
