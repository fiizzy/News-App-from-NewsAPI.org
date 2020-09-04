import 'package:flutter/material.dart';
import 'package:news_app/models/newsArticleModel.dart';
import 'package:news_app/models/newsArticleModel.dart';
import 'package:news_app/viewmodels/newArticleListViewModel.dart';
import 'package:news_app/viewmodels/newsArticleViewModel.dart';

// ignore: must_be_immutable
class NewsListView extends StatelessWidget {
  List<NewsArticleViewModel> articles;

  NewsListView({this.articles});
  

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      // separatorBuilder: (BuildContext context, int index) => Divider( height: 0, color: Colors.black87),
      itemExtent: 130,
      itemCount: articles.length,
      itemBuilder: (BuildContext context, int index) {
        var compArticles = articles;
        var image = compArticles[index].imageURL == null
            ? Image.asset("images/news-placeholder.png")
            : new Image.network(compArticles[index].imageURL);

        return Card(
          margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 5.0),
          child: ListTile(
            contentPadding:
                EdgeInsets.symmetric(horizontal: 10.0, vertical: 20),
            leading: Container(
              child: image,
              height: 100,
              width: 100,
            ),
            title: Text(compArticles[index].title),
          ),
        );
      },
    );
  }
}
