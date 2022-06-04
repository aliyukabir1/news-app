import 'package:flutter/material.dart';

class NewsDetailPage extends StatelessWidget {
  const NewsDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // NewsServices services = NewsServices();
    // services.getNews();
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
            child: Column(
          children: [
            const NewsImageDisplay(),
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
                    child: const Text(
                      'A ruggedly beautiful quarantine site',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 23,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'In addition to their latest tracks and playlists, musicians can use Spotifys artist profile pages to promote merchandise and concert dates. Soon, they may be able to use those pages to promote NFTs a… [+1419 chars]',
                    style: TextStyle(
                        fontSize: 18,
                        color: Color.fromARGB(255, 70, 68, 68),
                        height: 1.5),
                  ),
                  TextButton(
                      onPressed: () {},
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
  const NewsImageDisplay({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      height: MediaQuery.of(context).size.height * .35,
      width: double.infinity,
      color: Colors.grey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                  onPressed: () {},
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
          const Text(
            ' 06/24/2022',
            style: TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }
}
