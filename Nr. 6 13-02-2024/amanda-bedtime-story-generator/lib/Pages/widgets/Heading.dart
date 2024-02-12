import 'package:flutter/material.dart';

/// This is the text to the top left
class Heading extends StatelessWidget {
  const Heading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Welcome to the",
          style: TextStyle(
              fontSize: 24, color: Color.fromARGB(255, 223, 240, 255)),
        ),
        Text(
          "Bedtime story",
          style: TextStyle(
              fontSize: 42,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 223, 240, 255)),
        ),
        Text(
          "generator!",
          style: TextStyle(
              fontSize: 24, color: Color.fromARGB(255, 223, 240, 255)),
        )
      ],
    );
  }
}
