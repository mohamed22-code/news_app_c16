import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:news_app_c16/home/News/news_view_model.dart';
import 'package:news_app_c16/l10n/app_localizations.dart';
import 'package:news_app_c16/search/presention/search_view/search_view/search_view.dart';
import 'package:provider/provider.dart';


import 'core/Providers/AppSharedPreferences.dart';
import 'core/Providers/language_provider.dart';
import 'core/Providers/theme_provider.dart';
import 'core/design/app_routes.dart';
import 'core/design/app_theme.dart';
import 'home/home_screen.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppSharedPreferences.init();
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider(create: (_) => ThemeProvider()),
      ChangeNotifierProvider(create: (_) => LanguageProvider()),
      ChangeNotifierProvider(create: (_) => NewsViewModel()),
    ],
      child: MyApp(),
    )

  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeProvider>(context);
    var languageProvider = Provider.of<LanguageProvider>(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: languageProvider.currentLocale,
      initialRoute: AppRoutes.homeRouteName,
      routes: {
        AppRoutes.homeRouteName: (context) => HomeScreen(),
        // AppRoutes.searchRouteName: (context) => SearchView(),
      },
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: themeProvider.getTheme,
    );
  }
}

