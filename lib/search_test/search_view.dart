// // search_viewmodel.dart
// import 'dart:async';
// import 'package:flutter/foundation.dart';
// import 'package:news_app_c16/model/NewsResponse.dart';
// import 'package:news_app_c16/search_test/search_reposatory.dart';
//
// class SearchViewModel extends ChangeNotifier {
//   final SearchRepository repository;
//   SearchViewModel({required this.repository});
//
//   List<News> _results = [];
//   List<News> get results => _results;
//
//   bool _isLoading = false;
//   bool get isLoading => _isLoading;
//
//   String _error = '';
//   String get error => _error;
//
//   String _query = '';
//   String get query => _query;
//
//   Timer? _debounce;
//
//   void updateQuery(String q) {
//     _query = q;
//     _error = '';
//     _debounce?.cancel();
//     _debounce = Timer(const Duration(milliseconds: 400), () {
//       if (_query.trim().isEmpty) {
//         clearResults();
//       } else {
//         _performSearch(_query.trim());
//       }
//     });
//     notifyListeners();
//   }
//
//   Future<void> _performSearch(String q) async {
//     _isLoading = true;
//     notifyListeners();
//     try {
//       final r = await repository.search(q);
//       _results = r;
//       _error = '';
//     } catch (e) {
//       _results = [];
//       _error = e.toString();
//     } finally {
//       _isLoading = false;
//       notifyListeners();
//     }
//   }
//
//   void clearResults() {
//     _results = [];
//     _isLoading = false;
//     _error = '';
//     notifyListeners();
//   }
//
//   @override
//   void dispose() {
//     _debounce?.cancel();
//     super.dispose();
//   }
// }
