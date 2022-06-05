import 'package:flutter/material.dart';

class NewsProvider extends ChangeNotifier {
  bool isBusy = false;
  void setState() {
    isBusy = !isBusy;
    notifyListeners();
  }
  // Future<News> getNewsAll()async{

  // }
}
