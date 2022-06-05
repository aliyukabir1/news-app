import 'package:flutter/material.dart';
import 'package:news_app/views/home_page/home_page.dart';

void main() {
  runApp(const MyApp());
}

//api to use https://newsapi.org/v2/everything?q=bitcoin&apiKey=4e703fee62094a8fa563e24123f68cfd
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'News app',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}
