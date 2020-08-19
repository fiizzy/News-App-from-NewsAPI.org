class NewsArticle {
  final String title;
  final String description;
  final String urlToImage;
  final String url;

  NewsArticle({this.description, this.title, this.url, this.urlToImage});

  factory NewsArticle.fromJson(Map json) {
    return  NewsArticle(
      title: json['title'],
      description: json['description'],
      urlToImage: json['urlToImage'],
      url: json['url'],
    );
  }
}
