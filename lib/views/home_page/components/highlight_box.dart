import 'package:flutter/material.dart';

class HighlightBox extends StatelessWidget {
  const HighlightBox({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 20),
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
      height: 200,
      width: 300,
      decoration: BoxDecoration(
          color: Colors.red, borderRadius: BorderRadius.circular(20)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                '2 hours ago',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.bookmark,
                    color: Colors.white,
                  ))
            ],
          ),
          const Text(
            'A ruggedly beautiful quarantine sit',
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        ],
      ),
    );
  }
}
