import 'package:news_app_c16/model/NewsResponse.dart';

abstract class SearchState{}

class InitState extends SearchState{}
class LoadingState extends SearchState{}
class SuccessState extends SearchState{
  final List<News> news;
  SuccessState(this.news);
}
class ErrorState extends SearchState{
  final String error;
  ErrorState(this.error);
}
class EmptyState extends SearchState{
  final String message;
  EmptyState(this.message);
}
