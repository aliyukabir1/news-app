import 'package:flutter/material.dart';

import 'components.dart';

class CustomTabBarView extends StatelessWidget {
  const CustomTabBarView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                  itemCount: 10,
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
                            borderRadius: BorderRadius.circular(10)),
                      ),
                      title: Text(
                          '$index Animals get boost from southampton tree vandals'),
                      subtitle: const Text('10 minutes ago'),
                      trailing: const Icon(Icons.bookmark, size: 15),
                    );
                  }),
            ),
          ),
        ],
      ),
    );
  }
}
