import 'package:flutter/material.dart';
import 'package:news_app_c16/search_test/search_view.dart';
import 'package:provider/provider.dart';

class NewsSearchDelegate extends SearchDelegate {
  @override
  String get searchFieldLabel => 'search';

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      if (query.isNotEmpty)
        IconButton(
          icon: const Icon(Icons.clear),
          onPressed: () => query = '',
        )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () => close(context, null),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final vm = Provider.of<SearchViewModel>(context, listen: false);
    vm.updateQuery(query);

    return Consumer<SearchViewModel>(
      builder: (context, vm, _) {
        if (vm.isLoading) return const Center(child: CircularProgressIndicator());
        if (vm.error.isNotEmpty) return Center(child: Text('خطأ: ${vm.error}'));
        if (vm.results.isEmpty) return const Center(child: Text('لا توجد نتائج'));

        return ListView.separated(
          itemCount: vm.results.length,
          separatorBuilder: (_, __) => const Divider(),
          itemBuilder: (context, index) {
            final article = vm.results[index];
            return ListTile(
              leading: article.urlToImage != null
                  ? Image.network(article.urlToImage!, width: 80, fit: BoxFit.cover)
                  : null,
              title: Text(article.title ?? 'بدون عنوان'),
              subtitle: Text(article.source?.name ?? ''),
            );
          },
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return const Center(child: Text('ابدأ بالبحث...'));
  }
}
