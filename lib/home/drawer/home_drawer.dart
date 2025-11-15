import 'package:flutter/material.dart';
import 'package:news_app_c16/design/app_colors.dart';
import 'package:news_app_c16/design/app_styles.dart';
import 'package:news_app_c16/home/drawer/widget/app_config_item.dart';
import 'package:news_app_c16/home/drawer/widget/dividert_item.dart';
import 'package:news_app_c16/home/drawer/widget/drawer_item.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: height*0.2,
          color: AppColors.whiteColor,
          alignment: Alignment.center,
          child: Text('News App',
          style: AppStyles.bold24Black,),
        ),
        DrawerItem(iconName: Icons.home_filled, text: 'Go To Home'),
        DividertItem(),
        DrawerItem(iconName: Icons.home_filled, text: 'Theme'),
        AppConfigItem(name: 'Dark'),
        SizedBox(height: height*0.02),
        DividertItem(),
        DrawerItem(iconName: Icons.home_filled, text: 'Language'),
        AppConfigItem(name: 'English'),
        SizedBox(height: height*0.02),
      ],
    );
  }
}
