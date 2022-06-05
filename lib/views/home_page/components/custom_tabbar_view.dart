import 'package:flutter/material.dart';
import 'package:news_app/model/news.dart';
import 'package:news_app/services/news_services.dart';

import 'components.dart';

class CustomTabBarView extends StatelessWidget {
  final String category;
  const CustomTabBarView({
    Key? key,
    required this.category,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: NewsServices().getNews(category),
        builder: (context, snapshot) {
          List<News?> listOfNews = snapshot.data as List<News?>;
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasData) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: const [
                        HighlightBox(),
                        HighlightBox(),
                        HighlightBox(),
                        HighlightBox(),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "Latest News",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Expanded(
                    child: SingleChildScrollView(
                      child: ListView.separated(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: listOfNews.length,
                          separatorBuilder: (_, index) {
                            return const SizedBox(
                              height: 20,
                            );
                          },
                          itemBuilder: (context, index) {
                            return ListTile(
                              leading: Container(
                                width: 70,
                                height: 70,
                                decoration: BoxDecoration(
                                    color: Colors.greenAccent,
                                    borderRadius: BorderRadius.circular(10),
                                    image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: NetworkImage(
                                            listOfNews[index]!.urlToImage))),
                              ),
                              title: Text(listOfNews[index]!.title),
                              subtitle: Text(listOfNews[index]!.publishedAt),
                              trailing: const Icon(Icons.bookmark, size: 15),
                            );
                          }),
                    ),
                  ),
                ],
              ),
            );
          } else {
            return const Center(child: Text('oops something went wrong'));
          }
        });
  }
}
