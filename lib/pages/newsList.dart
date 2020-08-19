import 'package:flutter/material.dart';
import 'package:news_app/viewmodels/newArticleListViewModel.dart';
import 'package:news_app/viewmodels/newsArticleViewModel.dart';
import 'package:provider/provider.dart';

class NewsList extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {

    final vm = Provider.of <NewsListViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("News Healine"),
      ),
      body: ListView.builder(
        itemCount: vm.articles.length,
        itemBuilder: (BuildContext context, int index) {
        var image = vm.articles[index].imageURL == null ? Image.asset("images/news-placeholder.png" ) : new Image.network(vm.articles[index].imageURL);
                return ListTile(
                  leading: Container(
                    child: image,
                    height: 100,
                    width: 100,),
          title: Text(vm.articles[index].title),
        );
       },
      ),
    );
  }
}
