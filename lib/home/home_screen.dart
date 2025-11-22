import 'dart:async';

import 'package:flutter/material.dart';
import 'package:news_app_c16/home/News/news_item.dart';
import 'package:news_app_c16/home/News/news_view_model.dart';

import 'package:news_app_c16/home/category_details/category_details.dart';
import 'package:news_app_c16/home/drawer/home_drawer.dart';
import 'package:news_app_c16/l10n/app_localizations.dart';
import 'package:news_app_c16/model/category.dart';
import 'package:news_app_c16/search_test/news_search.dart';
import 'package:provider/provider.dart';

import '../core/design/app_colors.dart';
import 'category_fragment/category_fragment.dart';



class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Category? selectedCategory;
  bool isSearching = false;
  final TextEditingController searchController = TextEditingController();


  Timer? _debounce;
  @override
  void dispose() {
    _debounce?.cancel();
    searchController.dispose();
    super.dispose();
  }
  void _onSearchChanged(String query) {
    if(_debounce?.isActive??false)
      _debounce!.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      final vm = Provider.of<NewsViewModel>(context, listen: false);
      vm.filterNews(query);
    });
  }


  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<NewsViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: isSearching?TextField(
          controller: searchController,
          autofocus: true,
          decoration: const InputDecoration(
            hintText: 'Search',
            border: InputBorder.none,
          ),style: TextStyle(color: AppColors.whiteColor),
          onChanged: _onSearchChanged,
          // onSubmitted: (value){
          //   _debounce?.cancel();
          //   final vm = Provider.of<NewsViewModel>(context, listen: false);
          //   vm.filterNews(value);
          // },
        ): Text(
          selectedCategory == null ?
          AppLocalizations.of(context)!.title_home_screen: selectedCategory!.title,
          style: Theme
              .of(context)
              .textTheme
              .headlineLarge,),
        actions: [
          isSearching
              ? IconButton(
            icon: const Icon(Icons.close),
            onPressed: () {
              setState(() {
                isSearching = false;
                searchController.clear();
                vm.clearFilter();
              });
            },
          )
              : IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              setState(() {
                isSearching = true;
                vm.clearFilter();
              });
            },
          )
        ],

      ),
      drawer: Drawer(child: HomeDrawer(onDrawerItemClick: onDrawerItemClick,),
        backgroundColor: AppColors.blackColor,),
      // body: selectedCategory == null?
      // CategoryFragment(onCategoryItemClick: onCategoryItemClick,):
      // CategoryDetails(category: selectedCategory!,),
      body: isSearching
          ? _buildSearchResults(vm)
          : (selectedCategory == null ? CategoryFragment(onCategoryItemClick: onCategoryItemClick) : CategoryDetails(category: selectedCategory!)),
    );
  }

  Widget _buildSearchResults(NewsViewModel vm) {
    final results = vm.filteredList ?? [];
    print('newList length = ${vm.newList?.length}');
    print('filteredList length = ${vm.filteredList?.length}');
    if (vm.errorMessage != null && (results.isEmpty)) {
      return Center(child: Text(vm.errorMessage!));
    }
    if (results.isEmpty) {
      return Center(child: Text('No results'));
    }
    return ListView.builder(
      padding: const EdgeInsets.symmetric(vertical: 8),
      itemCount: results.length,
      itemBuilder: (context, index) {
        final news = results[index];
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: NewsItem(news: news),
        );
      },
    );
  }

  void onCategoryItemClick(Category newSelectedCategory) {
    selectedCategory = newSelectedCategory;
    final vm = Provider.of<NewsViewModel>(context, listen: false);
    vm.getNewsBySourceId(newSelectedCategory.id);
    setState(() {
// Provider.of<NewsViewModel>(context, listen: false).getNewsBySourceId(newSelectedCategory.id);
    });
  }

  void onDrawerItemClick(){
    selectedCategory=null;
    Navigator.pop(context);
    setState(() {

    });
  }
}



