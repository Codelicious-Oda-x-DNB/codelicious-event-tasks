import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../main.dart';

class GeneratorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    var pair = appState.current;
    final theme = Theme.of(context);

    IconData icon;
    if (appState.favorites.contains(pair)) {
      icon = Icons.favorite;
    } else {
      icon = Icons.favorite_border;
    }

    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/disney.jpeg"),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
            color: Color.fromARGB(200, 59, 59, 186),
            borderRadius: BorderRadius.all(Radius.circular(15))),
        margin: EdgeInsets.all(200),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Bedtime story generator",
                style: TextStyle(
                    fontSize: 30, color: Color.fromARGB(198, 223, 240, 255)),
              ),
              SizedBox(height: 40),
              BigCard(pair: pair),
              SizedBox(height: 10),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ElevatedButton.icon(
                    onPressed: () {
                      appState.toggleFavorite();
                    },
                    icon: Icon(icon),
                    label: Text('Like'),
                  ),
                  SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: () {
                      appState.getNext();
                    },
                    child: Text('Generate'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
