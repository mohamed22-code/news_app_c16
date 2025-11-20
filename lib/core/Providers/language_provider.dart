import 'package:flutter/material.dart';
import 'package:news_app_c16/core/Providers/AppSharedPreferences.dart';

class LanguageProvider extends ChangeNotifier {
  Locale currentLocale = const Locale("en");

  LanguageProvider() {
    currentLocale = AppSharedPreferences.getInstance().getCurrentLocale();
  }

  void changeLanguage(Locale locale) {
    currentLocale = locale;
    AppSharedPreferences.getInstance().saveLocale(locale);
    notifyListeners();
  }

  bool get isArabic => currentLocale.languageCode == "ar";
}
