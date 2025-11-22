import 'package:flutter/material.dart';
import 'package:news_app_c16/api/dio_api_manager.dart';
import 'package:news_app_c16/model/NewsResponse.dart';

class NewsViewModel extends ChangeNotifier{
// todo: hold date -handel logic
  List<News>? newList;
  List<News>? filteredList;
String? errorMessage;


Future<void> getNewsBySourceId(String sourceId)async{
  try{
    var newsResponse = await DioApiManager().getNewsSourceById(sourceId);
    if(newsResponse.status == 'error'){
      errorMessage = newsResponse.message;
      newList = [];
      filteredList=[];
    }else{
      newList = newsResponse.articles?? [];
      filteredList = List.from(newList!);
    }
  }catch(e){
    errorMessage = e.toString();
    newList = [];
    filteredList = [];
  }
  print('getNewsBySourceId: newList length = ${newList?.length}');
  notifyListeners();

}
void filterNews(String query){
  final q = query.trim().toLowerCase();
  if(q.isEmpty){
    filteredList = newList != null ? List.from(newList!):[];
  }else{
    filteredList=newList?.where((news){
      final title = (news.title ?? '').toLowerCase();
      final description = (news.description ?? '').toLowerCase();
      final author = (news.author ?? '').toLowerCase();
      return title.contains(q) || description.contains(q) || author.contains(q);
    }).toList();
  }
  notifyListeners();
}

  void clearFilter() {
    filteredList = newList != null ? List.from(newList!) : [];
    notifyListeners();
  }
}
