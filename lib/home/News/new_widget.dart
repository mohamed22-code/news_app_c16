
import 'package:flutter/material.dart';
import 'package:news_app_c16/api/api_manager.dart';
import 'package:news_app_c16/api/dio_api_manager.dart';
import 'package:news_app_c16/home/News/news_item.dart';
import 'package:news_app_c16/model/NewsResponse.dart';
import 'package:news_app_c16/model/SourceResponse.dart';

import '../../core/design/app_colors.dart';

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






//
// import 'package:flutter/material.dart';
// import 'package:news_app_c16/home/News/news_item.dart';
// import 'package:news_app_c16/home/News/news_view_model.dart';
// import 'package:news_app_c16/model/SourceResponse.dart';
// import 'package:provider/provider.dart';
//
// import '../../core/design/app_colors.dart';
//
// class NewWidget extends StatefulWidget {
//   final Source source;
//   const NewWidget({super.key, required this.source});
//
//   @override
//   State<NewWidget> createState() => _NewWidgetState();
// }
//
// class _NewWidgetState extends State<NewWidget> {
//   bool _isInit = false;
//
//   @override
//   void didChangeDependencies() {
//     super.didChangeDependencies();
//     if (!_isInit) {
//       final vm = Provider.of<NewsViewModel>(context, listen: false);
//       // fetch data for this source
//       vm.getNewsBySourceId(widget.source.id ?? '');
//       _isInit = true;
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final vm = Provider.of<NewsViewModel>(context);
//     final height = MediaQuery.of(context).size.height;
//
//     // if vm.newList is null => still loading (we set it null initially until fetch)
//     if (vm.newList == null) {
//       return Center(
//         child: CircularProgressIndicator(color: AppColors.greyColor),
//       );
//     }
//
//     // if error
//     if (vm.errorMessage != null && (vm.newList?.isEmpty ?? true)) {
//       return Column(
//         children: [
//           Text('something went wrong', style: Theme.of(context).textTheme.labelMedium),
//           ElevatedButton(
//             onPressed: () {
//               vm.getNewsBySourceId(widget.source.id ?? '');
//             },
//             child: Text('Try Again', style: Theme.of(context).textTheme.labelMedium),
//           ),
//         ],
//       );
//     }
//
//     final listToShow = vm.filteredList ?? vm.newList ?? [];
//
//     if (listToShow.isEmpty) {
//       return Center(child: Text('No articles'));
//     }
//
//     return ListView.separated(
//       padding: EdgeInsets.only(top: height * 0.02),
//       itemBuilder: (context, index) {
//         return NewsItem(news: listToShow[index]);
//       },
//       separatorBuilder: (context, index) => SizedBox(height: height * 0.02),
//       itemCount: listToShow.length,
//     );
//   }
// }
