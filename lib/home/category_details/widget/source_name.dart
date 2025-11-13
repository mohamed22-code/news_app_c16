import 'package:flutter/material.dart';
import 'package:news_app_c16/model/SourceResponse.dart';

class SourceName extends StatelessWidget {
  final Source source;
  final bool isSelected;
  const SourceName({super.key,required this.source,required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Text(source.name??'',
    style: isSelected?Theme.of(context).textTheme.labelLarge:
    Theme.of(context).textTheme.labelMedium,);
  }
}
