import 'package:flutter/material.dart';
import 'package:news_app_c16/design/app_colors.dart';
import 'package:news_app_c16/home/category_details/category_details.dart';
import 'package:news_app_c16/home/drawer/home_drawer.dart';
import 'package:news_app_c16/model/category.dart';

import 'category_fragment/category_fragment.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          selectedCategory == null ?
          'Home': selectedCategory!.title,
          style: Theme
              .of(context)
              .textTheme
              .headlineLarge,),
      ),
      drawer: Drawer(child: HomeDrawer(onDrawerItemClick: onDrawerItemClick,),
        backgroundColor: AppColors.blackColor,),
      body: selectedCategory == null?
      CategoryFragment(onCategoryItemClick: onCategoryItemClick,):
      CategoryDetails(category: selectedCategory!,),
    );
  }

  Category? selectedCategory;
  void onCategoryItemClick(Category newSelectedCategory) {
   selectedCategory = newSelectedCategory;
   setState(() {

   });
  }
  void onDrawerItemClick(){
   selectedCategory=null;
   Navigator.pop(context);
   setState(() {

   });
  }
}
