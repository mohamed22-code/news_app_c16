import 'package:dio/dio.dart';
import 'package:news_app_c16/api/api_constants.dart';
import 'package:news_app_c16/model/NewsResponse.dart';
import 'package:news_app_c16/model/SourceResponse.dart';

class DioApiManager{
   final Dio dio = Dio();
  /*
  https://newsapi.org/v2/top-headlines/sources?apiKey=26639ada56b74b3bbfddf0e648ea95ce
   */
 Future<SourceResponse> getSources({required String categoryId})async{
  try{
    var response=await dio.get('https://newsapi.org/v2/top-headlines/sources',
        queryParameters: {
          'apiKey' : ApiConstants.apiKey,
          'category':categoryId,
        });
    var json=response.data;
    var sourceResponse= SourceResponse.fromJson(json);
    return sourceResponse;
  }catch(e){
    rethrow;
  }


}

/*
  https://newsapi.org/v2/everything?q=bitcoin&apiKey=26639ada56b74b3bbfddf0e648ea95ce
   */
 Future<NewsResponse> getNewsSourceById(String sourceId)async{
  var response= await dio.get('https://newsapi.org/v2/everything',
  queryParameters: {
    'apiKey':ApiConstants.apiKey,
    'sources': sourceId,
  });
  var json = response.data;
  var newsResponse = NewsResponse.fromJson(json);
  return newsResponse;

}

// Future<NewsResponse> searchNewsByQuery(String query)async{
//    try{
//      var response = await dio.get('https://newsapi.org/v2/everything',
//        queryParameters: {
//        'apiKey':ApiConstants.apiKey,
//        'q':query,
//        'language':'en',
//        'sortBy':'publishedAt',
//        },
//        );
//        var json = response.data;
//        var newsResponse=NewsResponse.fromJson(json);
//        return newsResponse;
//        }catch(e){
//      rethrow;
//        }
// }

}