import 'package:flutter/material.dart';

import 'package:news_app_c16/home/category_details/category_details.dart';
import 'package:news_app_c16/home/drawer/home_drawer.dart';
import 'package:news_app_c16/l10n/app_localizations.dart';
import 'package:news_app_c16/model/category.dart';
import 'package:news_app_c16/search_test/news_search.dart';

import '../core/design/app_colors.dart';
import 'category_fragment/category_fragment.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Category? category;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          selectedCategory == null ?
          AppLocalizations.of(context)!.title_home_screen: selectedCategory!.title,
          style: Theme
              .of(context)
              .textTheme
              .headlineLarge,),
        actions: [
          IconButton(onPressed: () {

          }, icon: const Icon(Icons.search))
        ],

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










//
// import 'package:flutter/material.dart';
// import 'package:news_app_c16/home/category_details/category_details.dart';
// import 'package:news_app_c16/home/drawer/home_drawer.dart';
// import 'package:news_app_c16/l10n/app_localizations.dart';
// import 'package:news_app_c16/model/category.dart';
// import 'package:news_app_c16/core/design/app_colors.dart';
// import 'package:news_app_c16/home/category_fragment/category_fragment.dart';
// import 'package:news_app_c16/search_test/search_reposatory.dart';
// import 'package:news_app_c16/search_test/search_view.dart';
// import 'package:provider/provider.dart';
// import '../../api/dio_api_manager.dart';
// import '../../model/NewsResponse.dart';
//
// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});
//
//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }
//
// class _HomeScreenState extends State<HomeScreen> {
//   Category? selectedCategory;
//
//   @override
//   Widget build(BuildContext context) {
//     return ChangeNotifierProvider<SearchViewModel>(
//       create: (_) => SearchViewModel(
//         repository: SearchRepository(apiManager: DioApiManager()),
//       ),
//       child: Consumer<SearchViewModel>(
//         builder: (context, searchVM, _) => Scaffold(
//           appBar: AppBar(
//             title: selectedCategory != null
//                 ? Text(
//               selectedCategory!.title,
//               style: Theme.of(context).textTheme.headlineLarge,
//             )
//                 : _SearchField(),
//             backgroundColor: Colors.blue,
//           ),
//           drawer: Drawer(
//             child: HomeDrawer(onDrawerItemClick: onDrawerItemClick),
//             backgroundColor: AppColors.blackColor,
//           ),
//           body: selectedCategory != null
//               ? CategoryDetails(category: selectedCategory!)
//               : searchVM.query.isEmpty
//               ? CategoryFragment(onCategoryItemClick: onCategoryItemClick)
//               : _SearchResults(),
//         ),
//       ),
//     );
//   }
//
//   void onCategoryItemClick(Category newSelectedCategory) {
//     selectedCategory = newSelectedCategory;
//     setState(() {});
//   }
//
//   void onDrawerItemClick() {
//     selectedCategory = null;
//     Navigator.pop(context);
//     setState(() {});
//   }
// }
//
// /// الـ SearchField داخل الـ AppBar
// class _SearchField extends StatefulWidget {
//   @override
//   State<_SearchField> createState() => _SearchFieldState();
// }
//
// class _SearchFieldState extends State<_SearchField> {
//   final TextEditingController _controller = TextEditingController();
//
//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final vm = Provider.of<SearchViewModel>(context, listen: false);
//     _controller.text = vm.query;
//
//     return SizedBox(
//         height: 40,
//         child: TextField(
//             controller: _controller,
//             onChanged: (v) => vm.updateQuery(v),
//             textInputAction: TextInputAction.search,
//             onSubmitted: (v) => vm.updateQuery(v),
//             decoration: InputDecoration(
//               hintText: 'ابحث في الأخبار...',
//               isDense: true,
//               filled: true,
//               fillColor: Colors.white,
//               prefixIcon: const Icon(Icons.search),
//               suffixIcon: vm.query.isNotEmpty
//                   ? IconButton(
//                 icon: const Icon(Icons.clear),
//                 onPressed: () {
//                   _controller.clear();
//                   vm.updateQuery('');
//                 },
//               )
//                   : null,
//               contentPadding: const EdgeInsets.symmetric(vertical: 8),
//               border: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(8),
//                 borderSide: BorderSide.none,
//               ),
//             ),
//         ),
//     );
//   }
// }
//
// /// عرض نتائج البحث في body
// class _SearchResults extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final vm = Provider.of<SearchViewModel>(context);
//
//     if (vm.isLoading) {
//       return const Center(child: CircularProgressIndicator());
//     }
//     if (vm.error.isNotEmpty) {
//       return Center(child: Text('خطأ: ${vm.error}'));
//     }
//     if (vm.results.isEmpty) {
//       return const Center(child: Text('لا توجد نتائج'));
//     }
//
//     return ListView.separated(
//       padding: const EdgeInsets.all(8),
//       itemCount: vm.results.length,
//       separatorBuilder: (_, __) => const Divider(),
//       itemBuilder: (context, index) {
//         final article = vm.results[index];
//         return ListTile(
//           leading: article.urlToImage != null
//               ? Image.network(article.urlToImage!, width: 80, fit: BoxFit.cover)
//               : null,
//           title: Text(article.title ?? 'بدون عنوان'),
//           subtitle: Text(article.source?.name ?? ''),
//           onTap: () {
//             // ممكن تضيف فتح التفاصيل هنا
//           },
//         );
//       },
//     );
//   }
// }
