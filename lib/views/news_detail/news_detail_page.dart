import 'package:flutter/material.dart';
import 'package:news_app/views/webview/webview_page.dart';

class NewsDetailPage extends StatelessWidget {
  final String url, title, content, linkToPost, date;
  const NewsDetailPage(
      {Key? key,
      required this.url,
      required this.title,
      required this.content,
      required this.linkToPost,
      required this.date})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
            child: Column(
          children: [
            NewsImageDisplay(
              url: url,
              date: date,
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 20),
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: const BoxDecoration(
                      border: Border(
                          left: BorderSide(width: 5.0, color: Colors.orange)),
                    ),
                    child: Text(
                      title,
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 23,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    content,
                    style: const TextStyle(
                        fontSize: 18,
                        color: Color.fromARGB(255, 70, 68, 68),
                        height: 1.5),
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => WebViewPage(
                                      linkToPost: linkToPost,
                                    )));
                      },
                      child: const Text(
                        'See More >>',
                        style: TextStyle(fontSize: 18),
                      ))
                ],
              ),
            )
          ],
        )),
      ),
    );
  }
}

class NewsImageDisplay extends StatelessWidget {
  final String url, date;
  const NewsImageDisplay({
    Key? key,
    required this.url,
    required this.date,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      height: MediaQuery.of(context).size.height * .35,
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.grey, image: DecorationImage(image: NetworkImage(url))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  )),
              Row(
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                      )),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.bookmark,
                        color: Colors.white,
                      ))
                ],
              ),
            ],
          ),
          Text(
            date,
            style: const TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }
}
