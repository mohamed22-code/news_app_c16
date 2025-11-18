import 'package:flutter/cupertino.dart';
import 'package:news_app_c16/design/app_assets.dart';
import 'package:news_app_c16/l10n/app_localizations.dart';

class Category{
  String id;
  String title;
  String image;

  Category({required this.id,
    required this.title,
    required this.image});

  /*
  business entertainment general
  health science sports technology
   */

  static List<Category> getCategoryList(BuildContext context, bool isDark){
    return [
      Category(
        id: 'general',
        title: AppLocalizations.of(context)!.general,
        image: isDark ? AppAssets.generalLight : AppAssets.generalDark,
      ),
      Category(
        id: 'business',
        title: AppLocalizations.of(context)!.business,
        image: isDark ? AppAssets.busniessLight : AppAssets.businessDark,
      ),
      Category(
        id: 'entertainment',
        title: AppLocalizations.of(context)!.enterainment,
        image: isDark ? AppAssets.entertainmentLight : AppAssets.entertainmentDark,
      ),
      Category(
        id: 'health',
        title: AppLocalizations.of(context)!.health,
        image: isDark ? AppAssets.helthLight : AppAssets.healthDark,
      ),
      Category(
        id: 'sports',
        title: AppLocalizations.of(context)!.sports,
        image: isDark ? AppAssets.sportLight : AppAssets.sportsDark,
      ),
      Category(
        id: 'technology',
        title: AppLocalizations.of(context)!.technology,
        image: isDark ? AppAssets.technologyLight : AppAssets.technologyDark,
      ),
      Category(
        id: 'science',
        title: AppLocalizations.of(context)!.science,
        image: isDark ? AppAssets.scienceLight : AppAssets.scienceDark,
      ),

    ];
  }

}