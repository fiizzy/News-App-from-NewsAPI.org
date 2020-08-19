import 'package:news_app/models/newsArticleModel.dart';
import 'package:news_app/services/webService.dart';
import '../viewmodels/newsArticleViewModel.dart';
import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

class NewsListViewModel extends ChangeNotifier {
  List<NewsArticleViewModel> articles = List<NewsArticleViewModel>();

  NewsListViewModel() {
    populateHeadlines();
  }



  Future<void> populateHeadlines() async {
    List<NewsArticle> article = await WebService().fetchTopHeadlines();

    this.articles = article
        .map((article) => NewsArticleViewModel(article: article))
        .toList();
    notifyListeners();
  }
}
