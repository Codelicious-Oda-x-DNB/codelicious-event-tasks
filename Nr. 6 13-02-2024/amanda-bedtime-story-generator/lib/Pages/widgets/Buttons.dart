import 'package:flutter/material.dart';
import '../../main.dart';

/// This widget contains the "Like" and "Generate story" buttons
class Buttons extends StatelessWidget {
  const Buttons({
    super.key,
    required this.appState,
    required this.icon,
  });

  final MyAppState appState;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Row(
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
          child: Text('Generate story'),
        ),
      ],
    );
  }
}
