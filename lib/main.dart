import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './pages/newsList.dart';
import './viewmodels/newArticleListViewModel.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Newsheadline",
      home: ChangeNotifierProvider(
        create: (context)=> NewsListViewModel(),
        child: NewsList(),
      )
    );
  }
}

// b3b0fa951ae9463eb9399fb39a782e13
// https://newsapi.org/v2/top-headlines?country=us&apiKey=b3b0fa951ae9463eb9399fb39a782e13
