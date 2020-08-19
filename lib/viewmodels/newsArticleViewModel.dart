import '../models/newsArticleModel.dart';

class NewsArticleViewModel {
  NewsArticle _newsArticle = new NewsArticle();

  NewsArticleViewModel({NewsArticle article}) : _newsArticle = article;

  String get title {
    return _newsArticle.title;
  }

  String get description {
    return _newsArticle.description;
  }

  String get imageURL {
    return null;
  }

  String get url {
    return _newsArticle.url;
  }
}