import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../main.dart';

class FavoritesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();

    if (appState.favorites.isEmpty) {
      return Center(
        child: Text(
          'No favorites yet.',
          style: TextStyle(color: Colors.white),
        ),
      );
    }

    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: Text(
            'You have '
            '${appState.favorites.length} favorites:',
            style: TextStyle(color: Colors.white),
          ),
        ),
        for (var pair in appState.favorites)
          ListTile(
            leading: Icon(Icons.favorite),
            title: Text(pair), // Text(pair.asLowerCase),
            textColor: Color.fromRGBO(255, 255, 255, 1),
          ),
      ],
    );
  }
}
