import 'package:flutter/material.dart';

/// This is the search field "What do you want to generate a story about?"
class SearchInput extends StatelessWidget {
  const SearchInput({
    super.key,
    required this.myController,
  });

  final TextEditingController myController;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 700,
      height: 120,
      padding: EdgeInsets.symmetric(vertical: 30, horizontal: 30),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(60)),
        color: const Color.fromARGB(176, 255, 255, 255),
      ),
      child: TextField(
        controller: myController,
        style: TextStyle(
          color: Colors.white,
        ),
        decoration: InputDecoration(
          filled: true,
          fillColor: Color.fromARGB(225, 55, 6, 180),
          hintText: 'What do you want to generate a story about?',
          hintStyle: TextStyle(
            fontSize: 20,
            color: Colors.white,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
            borderSide: BorderSide.none,
          ),
          prefixIcon: Icon(
            Icons.search,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
