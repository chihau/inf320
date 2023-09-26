import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  MainApp({super.key});

  final List<WordPair> _sugestions = <WordPair>[];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('App Namer'),
        ),
        body: ListView.builder(
          itemBuilder: (BuildContext context, i) {
            print("i = $i");

            if (i.isOdd) {
              return const Divider();
            }

            _sugestions.addAll(generateWordPairs().take(1));

            return ListTile(
              title: Text(
                _sugestions[i].asPascalCase,
                style: const TextStyle(
                  fontSize: 20,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
