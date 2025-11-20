import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'app_styles.dart';

class AppTheme{
  static final ThemeData lightTheme = ThemeData(
    primaryColor: AppColors.whiteColor,
    splashColor: AppColors.blackColor,
    scaffoldBackgroundColor: AppColors.whiteColor,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.whiteColor,
      iconTheme: IconThemeData(color: AppColors.blackColor),
      centerTitle: true,
    ),
    textTheme: TextTheme(
      titleLarge: AppStyles.bold24White,
      bodyMedium: AppStyles.medium14White,
      labelLarge: AppStyles.bold16Black,
      labelSmall: AppStyles.medium12grey,
      labelMedium: AppStyles.medium14Black,
      headlineMedium: AppStyles.medium20Black,
      headlineLarge: AppStyles.medium24Black,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.whiteColor,
        textStyle: AppStyles.bold16Black,
        padding: EdgeInsets.all(16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(16),
        ),
      ),
    ),
  );
  static final ThemeData darkTheme = ThemeData(
      primaryColor: AppColors.blackColor,
      splashColor: AppColors.whiteColor,
      scaffoldBackgroundColor: AppColors.blackColor,
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.blackColor,
        iconTheme: IconThemeData(color: AppColors.whiteColor),
        centerTitle: true,
      ),
      textTheme: TextTheme(
        titleLarge: AppStyles.bold24Black,
        bodyMedium: AppStyles.medium14Black,
        labelLarge: AppStyles.bold16White,
        labelSmall: AppStyles.medium12grey,
        labelMedium: AppStyles.medium14White,
        headlineMedium: AppStyles.medium20White,
        headlineLarge: AppStyles.medium24White,
      ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.blackColor,
        textStyle: AppStyles.bold16White,
        padding: EdgeInsets.all(16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(16),
        ),
      ),
    ),
  );
}