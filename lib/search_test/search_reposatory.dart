// // search_repository.dart
// import 'package:news_app_c16/api/dio_api_manager.dart';
// import 'package:news_app_c16/model/NewsResponse.dart';
//
// class SearchRepository {
//   final DioApiManager apiManager;
//
//   SearchRepository({required this.apiManager});
//
//   Future<List<News>> search(String query) async {
//     if (query.trim().isEmpty) return [];
//     final resp = await apiManager.searchEverything(query.trim());
//     // افترض أن NewsResponse يحتوي على List<Article> articles
//     return resp.articles ?? [];
//   }
// }
