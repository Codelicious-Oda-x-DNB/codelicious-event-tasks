import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../main.dart';
import 'widgets/BigCard.dart';
import 'widgets/Buttons.dart';
import 'widgets/Heading.dart';
import 'widgets/SearchInput.dart';

/// This is the "main" page where we generate the stories
class GeneratorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    var pair = appState.current;
    final myController = appState.myController;

    IconData icon;
    if (appState.favorites.contains(pair)) {
      icon = Icons.favorite;
    } else {
      icon = Icons.favorite_border;
    }

    return Container(
      // Adding a background image
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/disney.jpeg"),
          fit: BoxFit.cover,
        ),
      ),

      child: Container(
        decoration:
            BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(15))),
        margin: EdgeInsets.all(86),
        child: Stack(children: [
          Align(
            alignment: Alignment.topLeft,
            child: Heading(),
          ),
          Align(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 100,
                ),
                SearchInput(myController: myController),
                SizedBox(height: 30),
                Buttons(appState: appState, icon: icon),
                SizedBox(height: 60),
                SizedBox(
                  width: 700,
                  height: 200,
                  child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: BigCard(story: pair)),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
