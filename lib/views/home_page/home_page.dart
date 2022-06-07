import 'package:flutter/material.dart';
import 'package:news_app/model/news.dart';
import 'package:news_app/services/news_services.dart';

import 'components/components.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(initialIndex: 0, length: 6, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'News',
          style: TextStyle(color: Colors.black54),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        bottom: buildTabBar(),
      ),

      body: FutureBuilder<List<News?>>(
          future: NewsServices().getHighLights(),
          builder: (context, snapshot) {
            final listOfHighlights = snapshot.data;

            //  print(listOfHighlights);
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: snapshot.connectionState == ConnectionState.waiting
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 20),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: listOfHighlights!
                                .map((news) => HighlightBox(
                                      date: news!.publishedAt,
                                      title: news.title,
                                      url: news.urlToImage,
                                      linkToPost: news.url,
                                      content: news.content,
                                    ))
                                .toList(),
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
                          child: TabBarView(
                              controller: tabController,
                              children: const [
                                CustomTabBarView(category: 'all'),
                                CustomTabBarView(category: 'tech'),
                                CustomTabBarView(category: 'health'),
                                CustomTabBarView(category: 'politics'),
                                CustomTabBarView(category: 'science'),
                                CustomTabBarView(category: 'sport'),
                              ]),
                        )
                      ],
                    ),
            );
          }),

      //buttom navbar
      bottomNavigationBar: BottomNavigationBar(
          fixedColor: Colors.orange,
          type: BottomNavigationBarType.fixed,
          currentIndex: 0,
          items: const [
            BottomNavigationBarItem(label: 'Home', icon: Icon(Icons.home)),
            BottomNavigationBarItem(label: 'Search', icon: Icon(Icons.search)),
            BottomNavigationBarItem(
                label: 'Bookmarks', icon: Icon(Icons.bookmark)),
            BottomNavigationBarItem(
                label: 'settings', icon: Icon(Icons.settings))
          ]),
    );
  }

//tab bar builder
  TabBar buildTabBar() {
    return TabBar(
      controller: tabController,
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 7),
      indicatorColor: Colors.orange,
      indicatorWeight: 3,
      indicatorSize: TabBarIndicatorSize.label,
      labelStyle: const TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
      labelPadding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
      unselectedLabelColor: Colors.grey,
      labelColor: Colors.black87,
      isScrollable: true,
      tabs: const [
        Text(
          'All news ',
        ),
        Text('Tech'),
        Text('Health'),
        Text('Politics'),
        Text('Science'),
        Text('Sport'),
      ],
    );
  }
}
