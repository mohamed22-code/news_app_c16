import 'package:flutter/material.dart';
import 'package:news_app_c16/home/category_details/category_details.dart';

import 'category_fragment/category_fragment.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
      title: Text('Home',style: Theme.of(context).textTheme.headlineLarge,),
    ),
      body: CategoryFragment(),
    );
  }
}
