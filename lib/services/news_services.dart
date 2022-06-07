import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/model/news.dart';

class NewsServices {
//final apiKey = '4e703fee62094a8fa563e24123f68cfd';
  //   Uri url = Uri.parse('https://newsapi.org/v2/everything?q=all?');
  Future<List<News?>> getNews(String category) async {
// headers
    Map<String, String> headers = {
      'authorization': '4e703fee62094a8fa563e24123f68cfd',
      'language': 'en',
    };
    List<News> finalListOfNew = [];
    try {
      await http
          .get(Uri.parse('https://newsapi.org/v2/everything?q=$category?'),
              headers: headers)
          .then((response) {
        var listOfNews = jsonDecode(response.body)['articles'];

        //  print(listOfNews);
        for (var eachNew in listOfNews) {
          finalListOfNew.add(News.fromJson(eachNew));
        }
      });
      return finalListOfNew;
    } catch (e) {
      return finalListOfNew;
    }
  }

  Future<List<News?>> getHighLights() async {
    List<News> finalListOfHighlightNews = [];
    try {
      await http
          .get(
        Uri.parse(
            'https://newsapi.org/v2/top-headlines?category=general&language=en&apiKey=4e703fee62094a8fa563e24123f68cfd'),
      )
          .then((response) {
        //   print(response.body);
        var listOfNews = jsonDecode(response.body)['articles'];

        for (var eachNew in listOfNews) {
          finalListOfHighlightNews.add(News.fromJson(eachNew));
        }
      });
      // print(finalListOfHighlightNews);
      return finalListOfHighlightNews;
    } catch (e) {
      return finalListOfHighlightNews;
    }
  }
}
