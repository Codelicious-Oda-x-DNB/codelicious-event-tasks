import 'package:flutter/material.dart';

/// This is the card where the respone from OpenAI's chatGPT is displayed
class BigCard extends StatelessWidget {
  const BigCard({
    super.key,
    required this.story,
  });

  final String story; // used to be WordPair pair

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color.fromARGB(225, 55, 6, 180),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          story,
          style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
        ),
      ),
    );
  }
}
