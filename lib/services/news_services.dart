import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/model/news.dart';

class NewsServices {
//final apiKey = '4e703fee62094a8fa563e24123f68cfd';
  Uri url = Uri.parse('https://newsapi.org/v2/everything?q=all?');

  Map<String, String> headers = {
    'authorization': '4e703fee62094a8fa563e24123f68cfd'
  };
  Future<News> getNews() async {
    final result = await http
        .get(Uri.parse('https://newsapi.org/v2/everything?q=all?'),
            headers: headers)
        .then((response) {
      News.fromJson(jsonDecode(response.body));
    });

    return result;
  }
}
