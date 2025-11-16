import 'package:flutter/material.dart';
import 'package:news_app_c16/api/api_manager.dart';
import 'package:news_app_c16/model/NewsResponse.dart';

class NewsViewModel extends ChangeNotifier{
// todo: hold date -handel logic
List<News>? newList;
String? errorMessage;
void getNewsBySourceId(String sourceId)async{
  try{
    var newsResponse = await ApiManager.getNewsBySourceId(sourceId);
    if(newsResponse.status == 'error'){
      errorMessage = newsResponse.message;
    }else{
      newList = newsResponse.articles;
    }
  }catch(e){
    errorMessage = e.toString();
  }
  notifyListeners();

}
}