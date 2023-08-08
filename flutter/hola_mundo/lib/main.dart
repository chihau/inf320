import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Hola Mundo!',
              style: TextStyle(
                fontSize: 40,
              ),
            ),
            Icon(
              Icons.star,
              color: Colors.green,
              size: 50,
            ),
          ],
        )),
      ),
    );
  }
}
