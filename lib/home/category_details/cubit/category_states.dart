import 'package:news_app_c16/model/SourceResponse.dart';

abstract class CategoryStates{}  //parent
class CategoryLoadingState extends CategoryStates{}
class CategoryInitialgState extends CategoryStates{}
class CategoryErrorState extends CategoryStates{
  String errorMessage;
  CategoryErrorState({required this.errorMessage});
}
class CategorySuccessState extends CategoryStates{
  List<Source> sourcesList;
  CategorySuccessState({required this.sourcesList});
}
