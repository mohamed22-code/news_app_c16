import 'package:intl/intl.dart';

extension StringToDateFormatter on String{
  String formatArticleDate(){
    DateFormat inputFormat = DateFormat("yyyy-MM-dd'T'hh:mm:ss");
    DateTime dateTime = inputFormat.parse(this);
    DateFormat outputFormat = DateFormat("EEE, MMM d, yyyy");
    return outputFormat.format(dateTime);
  }
}