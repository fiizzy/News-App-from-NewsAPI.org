import 'package:flutter/material.dart';
import 'package:news_app/viewmodels/newArticleListViewModel.dart';
import 'package:provider/provider.dart';

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
      body: ListView.builder(
        // separatorBuilder: (BuildContext context, int index) => Divider( height: 0, color: Colors.black87),
        itemExtent: 130,
        itemCount: vm.articles.length,
        itemBuilder: (BuildContext context, int index) {
          var articles = vm.articles;
          var image = articles[index].imageURL == null
              ? Image.asset("images/news-placeholder.png")
              : new Image.network(articles[index].imageURL);
          
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
              title: Text(articles[index].title),
            ),
          );
        },
      ),
    );
  }
}
