import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_c16/api/api_manager.dart';
import 'package:news_app_c16/home/category_details/cubit/category_states.dart';
import 'package:news_app_c16/model/SourceResponse.dart';

class CategotyViewModel extends Cubit<CategoryStates>{
  CategotyViewModel():super(CategoryLoadingState());

  //todo: hold date - handel logic
 // List<Source>? sourcesList;
 // String? errorMessage;

 void getSources(String categoryId)async{
   try{
     emit(CategoryLoadingState());
     var response = await ApiManager.getSource(categoryId: categoryId);
     if(response.status == 'error'){
       //todo: error server
       emit(CategoryErrorState(errorMessage: response.message!));
     return;
     }else{
       //todo: success
       emit(CategorySuccessState(sourcesList: response.sources!));
      return;
     }
   }catch(e){
     emit(CategoryErrorState(errorMessage: e.toString()));
   }
 }
}