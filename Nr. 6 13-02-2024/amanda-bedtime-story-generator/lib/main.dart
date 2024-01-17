import 'dart:convert';

import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:night_time_story/ChatCompletion.dart';
import 'package:provider/provider.dart';
import 'Pages/FavoritesPage.dart';
import 'Pages/GeneratorPage.dart';
import 'package:dio/dio.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: MaterialApp(
        title: 'Bedtime story',
        theme: ThemeData(
            useMaterial3: true,
            colorScheme: ColorScheme.fromSeed(
                seedColor: Colors.lightBlueAccent,
                onBackground: Color.fromRGBO(13, 33, 115, 1),
                primaryContainer: Color.fromRGBO(13, 33, 115, 1)),
            primaryColor: Color.fromRGBO(157, 211, 250, 1)),
        home: MyHomePage(),
      ),
    );
  }
}

class MyAppState extends ChangeNotifier {
  String current = ""; //WordPair.random();

  String OPENAI_API_KEY =
      'Bearer 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';

  final dio = Dio();
  Future<ChatCompletion> getOpen() async {
    final response = await dio.post(
      'https://api.openai.com/v1/chat/completions',
      data: {
        'model': 'gpt-3.5-turbo',
        'messages': [
          {
            'role': 'system',
            'content':
                'You are a poetic assistant, skilled in explaining complex programming concepts with creative flair.'
          },
          {
            'role': 'user',
            'content':
                'Compose a poem that explains the concept of recursion in programming.'
          }
        ]
      },
      options: Options(
        headers: {
          'Content-Type': 'application/json',
          'Authorization': OPENAI_API_KEY,
        },
      ),
    );
    Map<String, dynamic> map = response.data;

    ChatCompletion chatCompletion = ChatCompletion.fromJson(map);
    return chatCompletion;
  }

  void getNext() async {
    final response = await getOpen();
    //print("Content: " + response.choices[0].message.content);
    current = response.choices[0].message.content;
    notifyListeners();
  }

  var favorites = <String>[]; //<WordPair>[];

  void toggleFavorite() {
    if (favorites.contains(current)) {
      favorites.remove(current);
    } else {
      favorites.add(current);
    }
    notifyListeners();
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    Widget page;
    switch (selectedIndex) {
      case 0:
        page = GeneratorPage();
        break;
      case 1:
        page = FavoritesPage();
        break;
      default:
        throw UnimplementedError('no widget for $selectedIndex');
    }

    return LayoutBuilder(builder: (context, constraints) {
      return Scaffold(
        body: Row(
          children: [
            SafeArea(
              child: NavigationRail(
                extended: false,
                destinations: [
                  NavigationRailDestination(
                    icon: Icon(Icons.home),
                    label: Text('Home'),
                  ),
                  NavigationRailDestination(
                    icon: Icon(Icons.favorite),
                    label: Text('Favorites'),
                  ),
                ],
                selectedIndex: selectedIndex,
                onDestinationSelected: (value) {
                  setState(() {
                    selectedIndex = value;
                  });
                },
              ),
            ),
            Expanded(
              child: Container(
                color: Theme.of(context).colorScheme.primaryContainer,
                child: page,
              ),
            ),
          ],
        ),
      );
    });
  }
}

class BigCard extends StatelessWidget {
  const BigCard({
    super.key,
    required this.pair,
  });

  final String pair; // WordPair pair;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final style = theme.textTheme.displaySmall!.copyWith(
      color: theme.colorScheme.onPrimary,
    );

    return Card(
      color: theme.colorScheme.primary,
      elevation: 13,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(pair), //Text("${pair.first} ${pair.second}", style: style),
      ),
    );
  }
}
