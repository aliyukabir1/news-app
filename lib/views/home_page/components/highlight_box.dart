import 'package:flutter/material.dart';
import 'package:news_app/views/news_detail/news_detail_page.dart';

class HighlightBox extends StatelessWidget {
  final String date;
  final String title;
  final String url, linkToPost, content;
  const HighlightBox({
    Key? key,
    required this.date,
    required this.title,
    required this.url,
    required this.linkToPost,
    required this.content,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (_) => NewsDetailPage(
                      url: url,
                      title: title,
                      linkToPost: linkToPost,
                      content: content,
                      date: date,
                    )));
      },
      child: Container(
        margin: const EdgeInsets.only(right: 20),
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        height: 200,
        width: 300,
        decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.circular(20),
            image:
                DecorationImage(fit: BoxFit.cover, image: NetworkImage(url))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  date,
                  style: const TextStyle(color: Colors.white, fontSize: 16),
                ),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.bookmark,
                      color: Colors.white,
                    ))
              ],
            ),
            Text(
              title,
              style: const TextStyle(color: Colors.white, fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
