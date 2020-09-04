import 'package:news_app/models/newsArticleModel.dart';
import 'package:news_app/services/webService.dart';
import '../viewmodels/newsArticleViewModel.dart';
import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

enum LoadingStatus { completed, searching, empty }

class NewsListViewModel extends ChangeNotifier {
  List<NewsArticleViewModel> articles = List<NewsArticleViewModel>();

  var loadingStatus = LoadingStatus.searching;

  Future<void> populateHeadlinesSearch(keyword) async {
    this.loadingStatus = LoadingStatus.searching;
    notifyListeners();

    List<NewsArticle> article =
        await WebService().fetchTopHeadlinesBbyKeywords(keyword);
    this.articles = article
        .map((article) => NewsArticleViewModel(article: article))
        .toList();
    notifyListeners();

    this.loadingStatus =
        this.articles.isEmpty ? LoadingStatus.empty : LoadingStatus.completed;
    notifyListeners();

    print(articles);
  }

  Future<void> populateHeadlines() async {
    this.loadingStatus = LoadingStatus.searching;
    notifyListeners();

    List<NewsArticle> article = await WebService().fetchTopHeadlines();
    this.articles = article
        .map((article) => NewsArticleViewModel(article: article))
        .toList();
    notifyListeners();

    this.loadingStatus =
        this.articles.isEmpty ? LoadingStatus.empty : LoadingStatus.completed;
    notifyListeners();
  }
}

// class NewsListViewModelSearch extends ChangeNotifier {
//   List<NewsArticleViewModel> articles = List<NewsArticleViewModel>();

//   NewsListViewModelSearch() {
//     populateHeadlinesSearch();
//   }

//     print(article);
//   }
// }
