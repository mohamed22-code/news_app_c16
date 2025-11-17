import 'package:flutter/material.dart';
import 'package:news_app_c16/api/api_manager.dart';
import 'package:news_app_c16/api/dio_api_manager.dart';
import 'package:news_app_c16/design/app_colors.dart';
import 'package:news_app_c16/home/News/news_item.dart';
import 'package:news_app_c16/model/NewsResponse.dart';
import 'package:news_app_c16/model/SourceResponse.dart';

class NewWidget extends StatefulWidget {
  final Source source;
  const NewWidget({super.key,required this.source});

  @override
  State<NewWidget> createState() => _NewWidgetState();
}

class _NewWidgetState extends State<NewWidget> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return FutureBuilder<NewsResponse>(
        future: DioApiManager().getNewsSourceById(widget.source.id??''),
        builder: (context, snapshot) {
          if(snapshot.connectionState == ConnectionState.waiting){
            return Center(
              child: CircularProgressIndicator(
                color: AppColors.greyColor,
              ),
            );
          }else if(snapshot.hasError){
            return Column(
              children: [
                Text('something went wrong',
                style: Theme.of(context).textTheme.labelMedium,),
                ElevatedButton(onPressed: () {
                  DioApiManager().getNewsSourceById(widget.source.id??'');
                  setState(() {

                  });
                }, child: Text('Try Again',
                style: Theme.of(context).textTheme.labelMedium,))
              ],
            );
          }
          if(snapshot.data!.status != 'ok'){
            return Column(
              children: [
                Text(snapshot.data!.message!,
                  style: Theme.of(context).textTheme.labelMedium,),
                ElevatedButton(onPressed: () {
                  DioApiManager().getNewsSourceById(widget.source.id??'');
                  setState(() {

                  });
                }, child: Text('Try Again',
                  style: Theme.of(context).textTheme.labelMedium,))
              ],
            );
          }
          var newList = snapshot.data?.articles??[];
          return ListView.separated(
            padding: EdgeInsets.only(
              top: height*0.02
            ),
              itemBuilder: (context, index) {
                return NewsItem(news: newList[index]);
              },
            separatorBuilder:(context, index) => SizedBox(height: height*0.02,),
          itemCount: newList.length,);
          }
        ,);
  }
}
