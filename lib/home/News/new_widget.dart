import 'package:flutter/material.dart';
import 'package:news_app_c16/api/api_manager.dart';
import 'package:news_app_c16/design/app_colors.dart';
import 'package:news_app_c16/home/News/news_item.dart';
import 'package:news_app_c16/home/News/news_view_model.dart';
import 'package:news_app_c16/model/NewsResponse.dart';
import 'package:news_app_c16/model/SourceResponse.dart';
import 'package:provider/provider.dart';

class NewWidget extends StatefulWidget {
  final Source source;
  const NewWidget({super.key,required this.source});

  @override
  State<NewWidget> createState() => _NewWidgetState();
}

class _NewWidgetState extends State<NewWidget> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.getNewsBySourceId(widget.source.id??'');
  }
  NewsViewModel viewModel = NewsViewModel();
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return ChangeNotifierProvider(
      create: (context) => viewModel,
      child: Consumer<NewsViewModel>(
          builder: (context, viewModel, child) {
            if(viewModel.errorMessage != null){
              return Column(
                          children: [
                            Text(viewModel.errorMessage!,
                            style: Theme.of(context).textTheme.labelMedium,),
                            ElevatedButton(onPressed: () {
                              viewModel.getNewsBySourceId(widget.source.id??'');
                            }, child: Text('Try Again',
                            style: Theme.of(context).textTheme.labelMedium,))
                          ],
                        );
            }else if(viewModel.newList == null){
              return Center(
                child: CircularProgressIndicator(
                  color: AppColors.greyColor,
                ),
              );
            }else{
              return ListView.separated(
                        padding: EdgeInsets.only(
                          top: height*0.02
                        ),
                          itemBuilder: (context, index) {
                            return NewsItem(news: viewModel.newList![index]);
                          },
                        separatorBuilder:(context, index) => SizedBox(height: height*0.02,),
                      itemCount: viewModel.newList!.length,);
            }
          },)
      // FutureBuilder<NewsResponse>(
      //     future: ApiManager.getNewsBySourceId(widget.source.id??''),
      //     builder: (context, snapshot) {
      //       if(snapshot.connectionState == ConnectionState.waiting){
      //         return Center(
      //       //           child: CircularProgressIndicator(
      //       //             color: AppColors.greyColor,
      //       //           ),
      //       //         );
      //       }else if(snapshot.hasError){
      //
      //       }
      //       if(snapshot.data!.status != 'ok'){
      //         return Column(
      //           children: [
      //             Text(snapshot.data!.message!,
      //               style: Theme.of(context).textTheme.labelMedium,),
      //             ElevatedButton(onPressed: () {
      //               ApiManager.getNewsBySourceId(widget.source.id??'');
      //               setState(() {
      //
      //               });
      //             }, child: Text('Try Again',
      //               style: Theme.of(context).textTheme.labelMedium,))
      //           ],
      //         );
      //       }
      //       var newList = snapshot.data?.articles??[];
      //       return ListView.separated(
      //         padding: EdgeInsets.only(
      //           top: height*0.02
      //         ),
      //           itemBuilder: (context, index) {
      //             return NewsItem(news: newList[index]);
      //           },
      //         separatorBuilder:(context, index) => SizedBox(height: height*0.02,),
      //       itemCount: newList.length,);
      //       }
      //     ,),
    );
  }
}
