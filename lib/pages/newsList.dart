import 'package:flutter/material.dart';
import 'package:news_app/viewmodels/newArticleListViewModel.dart';
import 'package:provider/provider.dart';
import '../pages/widgets/newsListView.dart';

class NewsList extends StatefulWidget {
  @override
  _NewsListState createState() => _NewsListState();
}

class _NewsListState extends State<NewsList> {
  @override
  void initState() {
    super.initState();
    Provider.of<NewsListViewModel>(context, listen: false);
  }


  Widget build(BuildContext context) {
    final vm = Provider.of<NewsListViewModel>(context);
    return Scaffold(
      appBar: AppBar(title: Text("News Healine"), actions: <Widget>[
        // action button
        IconButton(
          icon: Icon(Icons.shopping_basket),
          onPressed: () {},
        ),
      ]),
      body: NewsListView(articles: vm.articles)
    );
  }
}
