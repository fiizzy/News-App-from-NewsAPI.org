import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/newsArticleModel.dart';

class WebService {
  Future<List<NewsArticle>> fetchTopHeadlines() async {
    String url =
        'https://newsapi.org/v2/top-headlines?country=us&apiKey=b3b0fa951ae9463eb9399fb39a782e13';

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final result = jsonDecode(response.body);
      Iterable list = result['articles'];
      return list.map((items) => NewsArticle.fromJson(items)).toList();
    } else {
      throw Exception("Something went wrong ${response.statusCode}");
    }
  }
}


