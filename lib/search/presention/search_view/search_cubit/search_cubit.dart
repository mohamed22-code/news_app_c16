import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_c16/search/data/services/search_api_services.dart';
import 'package:news_app_c16/search/presention/search_view/search_cubit/search_state.dart';

class SearchCubit extends Cubit<SearchState>{
  SearchCubit(this._searchApi): super (InitState());
  final SearchApi _searchApi;
  TextEditingController searchContoller = TextEditingController();

  Future<void> searchArticle ()async{
    emit(LoadingState());
    try{
      final response = await _searchApi.searchArticles(searchContoller.text);
      if(response.isEmpty){
        emit(EmptyState(searchContoller.text)
        );
      }else{
        emit(SuccessState(response));
      }
    }catch(e){
      emit(ErrorState(e.toString()));
    }
  }

}