import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app_c16/model/SourceResponse.dart';

import 'api_constants.dart';
import 'end_points.dart';

class ApiManager{
/*
https://newsapi.org/v2/top-headlines/sources?apiKey=26639ada56b74b3bbfddf0e648ea95ce
 */
  static Future<SourceResponse> getSource()async{
    Uri url = Uri.https(ApiConstants.baseUrl,EndPoints.sourceApi, {
      'apiKey':ApiConstants.apiKey});
   try{
     var response= await http.get(url);
     String responseBody = response.body;
     var json = jsonDecode(responseBody);
     return SourceResponse.fromJson(json);
   }catch(e){
     rethrow;
   }

  }
}