import 'package:dio/dio.dart';
import 'package:news_app_c16/home/article_screen/article_screen.dart';
import 'package:news_app_c16/model/NewsResponse.dart';
import 'package:news_app_c16/search/data/services/api_config.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class SearchApi{
  final Dio dio;
  SearchApi():dio = Dio(
    BaseOptions(
      baseUrl: ApiConfig.baseUrl,
      receiveTimeout: Duration(seconds: 10),
      connectTimeout: Duration(seconds: 10),
    ),
  )..interceptors.add(PrettyDioLogger(
    requestHeader: true,
    requestBody: true,
    responseBody: true,
    error: true
  ));

  Future<List<News>> searchArticles (String q)async {
    try {
      final response = await dio.get(
          ApiConfig.everything, queryParameters: {
        "q": q,
        "apiKey": ApiConfig.apiKey,
      });
      if (response.statusCode == 200 || response.statusCode == 201) {
        final newResponse = NewsResponse.fromJson(response.data);
        return newResponse.articles ?? [];
      } else {
        throw DioException(requestOptions: response.requestOptions,
            message: 'Faild to load News');
      }
    } on DioException catch (e) {
      if (e.type == DioException.connectionTimeout) {
        throw Exception('connection time out');
      } else if (e.type == DioException.receiveTimeout) {
        throw Exception('connection time out');
      } else if (e.response?.statusCode == 426) {
        throw Exception('request limit');
      }
      rethrow;
    }
  }
}