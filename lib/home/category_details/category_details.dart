import 'package:flutter/material.dart';
import 'package:news_app_c16/api/api_manager.dart';
import 'package:news_app_c16/design/app_colors.dart';
import 'package:news_app_c16/home/category_details/category_details_view_model.dart';
import 'package:news_app_c16/home/category_details/source_tap_widget.dart';
import 'package:news_app_c16/model/category.dart';
import 'package:provider/provider.dart';

class CategoryDetails extends StatefulWidget {
  final Category category;
  const CategoryDetails({super.key,required this.category});

  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  CategoryDetailsViewModel viewModel = CategoryDetailsViewModel();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.getSources(widget.category.id);
  }
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => viewModel,
      child: Consumer<CategoryDetailsViewModel>(
          builder: (context, viewModel, child) {
            if(viewModel.errorMessage != null){
              return Column(
                          children: [
                            Text(viewModel.errorMessage!,
                            style: Theme.of(context).textTheme.headlineMedium,),
                            ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColors.greyColor
                                ),
                                onPressed: () {
                                  setState(() {
                                    viewModel.getSources(widget.category.id);
                                  });
                                }, child: Text("Try again",
                            style: Theme.of(context).textTheme.labelMedium,))
                          ],
                        );
            }else if(viewModel.sourcesList == null){
              //todo: loading
              return Center(
                          child: CircularProgressIndicator(
                            color: AppColors.greyColor,
                          ),
                        );
            }else{
              //todo: success
              return SourceTapWidget(sourcesList: viewModel.sourcesList!,);
            }
          },)
      // FutureBuilder(
      //     future: ApiManager.getSource(categoryId: widget.category.id),
      //     builder: (context, snapshot) {
      //       //todo: loading
      //       if (snapshot.connectionState == ConnectionState.waiting){
      //         return Center(
      //           child: CircularProgressIndicator(
      //             color: AppColors.greyColor,
      //           ),
      //         );
      //       }
      //       //todo: error => client
      //       else if(snapshot.hasError){
      //         return Column(
      //           children: [
      //             Text('something went wrong'),
      //             ElevatedButton(
      //                 style: ElevatedButton.styleFrom(
      //                   backgroundColor: AppColors.greyColor
      //                 ),
      //                 onPressed: () {
      //                   setState(() {
      //
      //                   });
      //                   ApiManager.getSource(categoryId: widget.category.id);
      //                 }, child: Text("Try again",
      //             style: Theme.of(context).textTheme.labelMedium,))
      //           ],
      //         );
      //       }
      //       //todo: server => response => success, error
      //       if(snapshot.data?.status != 'ok'){
      //         return Column(
      //           children: [
      //             Text(snapshot.data!.message!),
      //             ElevatedButton(
      //                 style: ElevatedButton.styleFrom(
      //                     backgroundColor: AppColors.greyColor
      //                 ),
      //                 onPressed: () {
      //                   setState(() {
      //
      //                   });
      //                   ApiManager.getSource(categoryId: widget.category.id);
      //
      //                 }, child: Text("Try again",
      //               style: Theme.of(context).textTheme.labelMedium,))
      //           ],
      //         );
      //       }
      //       //todo: server => response => success
      //       var sourceList = snapshot.data?.sources ?? [];
      //       return SourceTapWidget(sourcesList: sourceList,);
      //     },),
    );
  }
}
