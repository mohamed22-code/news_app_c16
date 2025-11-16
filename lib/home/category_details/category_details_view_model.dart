import 'package:flutter/material.dart';
import 'package:news_app_c16/api/api_manager.dart';
import 'package:news_app_c16/model/SourceResponse.dart';

class CategoryDetailsViewModel extends ChangeNotifier{
  //todo: hold data , handel logic
  List<Source>? sourcesList;
  String? errorMessage;

  void getSources(String categoryId)async{
    //todo: reinitalizatize
    sourcesList=null;
    errorMessage =null;
    notifyListeners();
  try{
    var sourceResponse = await ApiManager.getSource(categoryId: categoryId);
    if(sourceResponse.status == 'error'){
      errorMessage = sourceResponse.message;
    }else{
      sourcesList = sourceResponse.sources;
    }
  }catch(e){
    errorMessage = e.toString();
  }
  notifyListeners();
  }
}