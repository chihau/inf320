import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MaterialApp(home: MainApp()));
}

List<String>? _saved = <String>[];

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  final List<WordPair> _suggestions = <WordPair>[];
  //final Set<WordPair> _saved = <WordPair>{};

  _saveData() async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.setStringList("saved", _saved!);
  }

  _loadData() async {
    final prefs = await SharedPreferences.getInstance();

    _saved = prefs.getStringList("saved");

    if (_saved == null) {
      _saved = [];
    }
  }

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  @override
  Widget build(BuildContext context) {
    print("build saved = " + _saved.toString());

    return Scaffold(
      appBar: AppBar(
        title: const Text('App Namer'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.navigate_next),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SecondScreen(),
                ),
              );
            },
          ),
        ],
      ),
      body: _buildSuggestions(),
    );
  }

  Widget _buildSuggestions() {
    return ListView.builder(
      itemBuilder: (BuildContext context, int i) {
        print("i = $i");

        if (i.isOdd) {
          return const Divider();
        }

        _suggestions.addAll(generateWordPairs().take(2));

        print("i = $i $_suggestions");

        bool alreadySaved = _saved!.contains(_suggestions[i].asPascalCase);

        return ListTile(
          title: Text(
            _suggestions[i].asPascalCase,
            style: const TextStyle(fontSize: 20),
          ),
          trailing: Icon(
            alreadySaved ? Icons.favorite : Icons.favorite_border,
            color: alreadySaved ? Colors.red : null,
          ),
          onTap: () async {
            print('onTap');

            setState(() {
              if (alreadySaved) {
                _saved!.remove(_suggestions[i].asPascalCase);
              } else {
                _saved!.add(_suggestions[i].asPascalCase);
              }
            });

            _saveData();

            print("saved = " + _saved.toString());

            final prefs = await SharedPreferences.getInstance();
            print("saved shared preferences = " +
                prefs.getStringList("saved").toString());
          },
        );
      },
    );
  }
}

class SecondScreen extends StatefulWidget {
  const SecondScreen({super.key});

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('App Namer - Saved'),
      ),
      body: ListView.builder(
          itemCount: _saved!.length,
          itemBuilder: (context, i) {
            print("i = $i");

            return ListTile(title: Text(_saved![i]));
          }),
    );
  }
}
