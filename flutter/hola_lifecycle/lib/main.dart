import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> with WidgetsBindingObserver {
  int _counter = 0;

  @override
  void initState() {
    super.initState();
    print("initState");
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    print("app state: " + state.toString());
    super.didChangeAppLifecycleState(state);
  }

  @override
  Widget build(BuildContext context) {
    print("build");

    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text(
            '$_counter',
            style: TextStyle(fontSize: 60),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              _counter++;
            });
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
