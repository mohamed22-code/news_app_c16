import 'package:flutter/material.dart';
import 'package:news_app_c16/design/app_colors.dart';
import 'package:news_app_c16/home/News/new_widget.dart';
import 'package:news_app_c16/home/category_details/widget/source_name.dart';
import 'package:news_app_c16/model/SourceResponse.dart';

class SourceTapWidget extends StatefulWidget {
   SourceTapWidget({super.key,required this.sourcesList});
  final List<Source> sourcesList;

  @override
  State<SourceTapWidget> createState() => _SourceTapWidgetState();
}

class _SourceTapWidgetState extends State<SourceTapWidget> {
   int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: widget.sourcesList.length,
        child: Column(
          children: [
            TabBar(
              tabAlignment: TabAlignment.start,
              dividerColor: AppColors.transparentColor,
              indicatorColor: Theme.of(context).splashColor,
              isScrollable: true,
                onTap: (index) {
                selectedIndex =index;
                setState(() {

                });
                },
                tabs: widget.sourcesList.map((source){
              return SourceName(source: source,
                  isSelected: selectedIndex == widget.sourcesList.indexOf(source));
            }).toList()),
            Expanded(child: NewWidget(source: widget.sourcesList[selectedIndex],))
          ],
        ));
  }
}
