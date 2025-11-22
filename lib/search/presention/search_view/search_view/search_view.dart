///search_view_model

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_c16/core/design/app_colors.dart';
import 'package:news_app_c16/home/News/news_item.dart';
import 'package:news_app_c16/search/data/services/search_api_services.dart';
import 'package:news_app_c16/search/presention/search_view/search_cubit/search_cubit.dart';
import 'package:news_app_c16/search/presention/search_view/search_cubit/search_state.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchCubit(SearchApi()),
      child: Scaffold(
          body:SearchViewContent()
      ),
    );
  }
}
class SearchViewContent extends StatelessWidget {
  const SearchViewContent({super.key});

  @override
  Widget build(BuildContext context) {
    final Cubit = context.read<SearchCubit>();
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextField(

                controller: Cubit.searchContoller,
                onChanged: (value) => Cubit.searchArticle(),
                decoration: InputDecoration(
                    hintText: 'search',
                    suffixIcon: IconButton(onPressed: () {
                      Cubit.searchContoller.clear();
                    }, icon: Icon(Icons.close)),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: AppColors.greyColor,
                            width: 2,
                            strokeAlign: 1),
                        borderRadius: BorderRadius.circular(16)
                    )
                ),
                style: Theme.of(context).textTheme.labelLarge,
              ),

              Expanded(
                child: BlocBuilder<SearchCubit, SearchState>(
                  builder: (context, state) {
                    if (state is LoadingState) {
                      return Center(child: CircularProgressIndicator(),);
                    } else if (state is EmptyState) {
                      return Center(child: Text('no result'),);
                    } else if (state is ErrorState) {
                      return Center(child: Text('${state.error}'),);
                    } else if (state is SuccessState) {
                      return ListView.separated(
                          itemBuilder: (context, index) {
                            return NewsItem(news: state.news[index]);
                          }, separatorBuilder: (context, index) => Divider(),
                          itemCount: state.news.length);
                    } else {
                      return SizedBox();
                    }
                  },),
              )
            ],
          ),
        ),
      ),
    );
  }
}
