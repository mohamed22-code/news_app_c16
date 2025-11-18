import 'package:flutter/material.dart';
import 'package:news_app_c16/design/app_colors.dart';
import 'package:news_app_c16/design/app_styles.dart';
import 'package:news_app_c16/home/drawer/widget/app_config_item.dart';
import 'package:news_app_c16/home/drawer/widget/dividert_item.dart';
import 'package:news_app_c16/home/drawer/widget/drawer_item.dart';
import 'package:provider/provider.dart';

import '../../design/Providers/theme_provider.dart';

class HomeDrawer extends StatelessWidget {
  final VoidCallback onDrawerItemClick;
  const HomeDrawer({super.key,required this.onDrawerItemClick});

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
        InkWell(
            onTap: () {
              onDrawerItemClick();
            },
            child: DrawerItem(iconName: Icons.home_filled, text: 'Go To Home')),
        DividertItem(),
        DrawerItem(iconName: Icons.light_mode, text: 'Theme'),
        InkWell(
          onTap: () {
            var themeProvider = Provider.of<ThemeProvider>(context, listen: false);

            if(themeProvider.isDark) {
              themeProvider.setTheme = ThemeMode.light;
            }else{
              themeProvider.setTheme = ThemeMode.dark;
            }
          },
          child: AppConfigItem(
            name: Provider.of<ThemeProvider>(context).isDark ? 'Dark' : 'Light',
          ),
        ),

        SizedBox(height: height*0.02),
        DividertItem(),
        DrawerItem(iconName: Icons.language, text: 'Language'),
        AppConfigItem(name: 'English'),
        SizedBox(height: height*0.02),
      ],
    );
  }
}
