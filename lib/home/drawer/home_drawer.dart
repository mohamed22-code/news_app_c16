import 'package:flutter/material.dart';
import 'package:news_app_c16/design/app_colors.dart';
import 'package:news_app_c16/design/app_styles.dart';
import 'package:news_app_c16/home/drawer/widget/app_config_item.dart';
import 'package:news_app_c16/home/drawer/widget/dividert_item.dart';
import 'package:news_app_c16/home/drawer/widget/drawer_item.dart';
import 'package:news_app_c16/l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../../design/Providers/language_provider.dart';
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
            child: DrawerItem(iconName: Icons.home_filled,
                text: AppLocalizations.of(context)!.go_to_home)),
        DividertItem(),
        DrawerItem(iconName: Icons.light_mode,
            text: AppLocalizations.of(context)!.theme),
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
            name: Provider.of<ThemeProvider>(context).isDark ?
            AppLocalizations.of(context)!.dark :
            AppLocalizations.of(context)!.light,
          ),
        ),

        SizedBox(height: height*0.02),
        DividertItem(),
        DrawerItem(iconName: Icons.language,
            text: AppLocalizations.of(context)!.language),

        InkWell(
          onTap: () {
            var langProvider = Provider.of<LanguageProvider>(context, listen: false);

            if (langProvider.isArabic) {
              langProvider.changeLanguage(const Locale("en"));
            } else {
              langProvider.changeLanguage(const Locale("ar"));
            }
          },
          child: AppConfigItem(
            name: Provider.of<LanguageProvider>(context).isArabic
                ? AppLocalizations.of(context)!.arabic
                : AppLocalizations.of(context)!.english,
          ),
        ),
        SizedBox(height: height*0.02),
      ],
    );
  }
}
