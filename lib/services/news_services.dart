import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/model/news.dart';

class NewsServices {
//final apiKey = '4e703fee62094a8fa563e24123f68cfd';
  Uri url = Uri.parse('https://newsapi.org/v2/everything?q=all?');

  Map<String, String> headers = {
    'authorization': '4e703fee62094a8fa563e24123f68cfd'
  };
  Future<List<News?>> getNews(String category) async {
    List<News> finalListOfNew = [];
    try {
      final result = await http
          .get(Uri.parse('https://newsapi.org/v2/everything?q=$category?'),
              headers: headers)
          .then((response) {
        var listOfNews = jsonDecode(response.body)['articles'];

        print(listOfNews);
        for (var eachNew in listOfNews) {
          finalListOfNew.add(News.fromJson(eachNew));
        }
        return finalListOfNew;
      });
      return result;
    } catch (e) {
      return finalListOfNew;
    }
  }
}
