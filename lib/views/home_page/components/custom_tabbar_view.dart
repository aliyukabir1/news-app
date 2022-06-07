import 'package:flutter/material.dart';
import 'package:news_app/services/news_services.dart';
import 'package:news_app/views/news_detail/news_detail_page.dart';

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
          dynamic listOfNews = snapshot.data;
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasData) {
            return SingleChildScrollView(
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
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => NewsDetailPage(
                                      url: listOfNews[index]!.url,
                                      title: listOfNews[index]!.title,
                                      linkToPost: listOfNews[index]!.url,
                                      content: listOfNews[index]!.content,
                                      date: listOfNews[index]!.publishedAt,
                                    )));
                      },
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
            );
          } else {
            return const Center(child: Text('oops something went wrong'));
          }
        });
  }
}
