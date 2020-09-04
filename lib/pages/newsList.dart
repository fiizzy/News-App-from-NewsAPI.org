import 'package:flutter/material.dart';
import 'package:news_app/models/newsArticleModel.dart';
import 'package:news_app/services/webService.dart';
import 'package:news_app/viewmodels/newArticleListViewModel.dart';
import 'package:news_app/viewmodels/newsArticleViewModel.dart';
import 'package:provider/provider.dart';
import '../pages/widgets/newsListView.dart';

class NewsList extends StatefulWidget {
  @override
  _NewsListState createState() => _NewsListState();
}

class _NewsListState extends State<NewsList> {
  final _controller = new TextEditingController();
  @override
  void initState() {
    super.initState();
    Provider.of<NewsListViewModel>(context, listen: false);
  }

  // WebService showSearch = new WebService();
  // List<NewsArticleViewModel> searchSerivce = List<NewsArticleViewModel>();

  Widget build(BuildContext context) {
    final vm = Provider.of<NewsListViewModel>(context);
    return Scaffold(
        appBar: AppBar(title: Text("News Healine"), actions: <Widget>[
          // action button
          IconButton(
            icon: Icon(Icons.shopping_basket),
            onPressed: () {
               vm.populateHeadlines();
            },
          ),
        ]),
        body: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(20),
              child: Form(
                  child: TextFormField(
                // ignore: missing_return
                onFieldSubmitted: (value){
                  if (value.isNotEmpty) {
                    vm.populateHeadlinesSearch(value);
                  }
                },
                controller: _controller,
                decoration: InputDecoration(
                    labelText: 'Enter Search',
                    prefixIcon: Icon(Icons.search),
                    suffixIcon: IconButton(
                      icon: Icon(Icons.clear),
                      onPressed: () {
                        _controller.clear();
                      },
                    )),
              )),
            ),
            Expanded(child: NewsListView(articles: vm.articles))
          ],
        ));
  }
}
