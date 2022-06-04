import 'package:flutter/material.dart';
import 'package:news_app/model/news.dart';

class NewsProvider extends ChangeNotifier {
  bool isBusy = false;
  void setState() {
    isBusy = !isBusy;
    notifyListeners();
  }
  // Future<News> getNewsAll()async{

  // }
}
