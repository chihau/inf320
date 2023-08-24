import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  int numeroDado = 1;

  @override
  Widget build(BuildContext context) {
    print('build: numeroDado = $numeroDado');

    return MaterialApp(
      home: Scaffold(
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //Image(image: AssetImage('images/dice_1.png')),
            Padding(
              padding: const EdgeInsets.all(50.0),
              child: Image.asset('images/dice_$numeroDado.png'),
            ),
            TextButton(
              onPressed: () {
                print('Botón presionado');
                setState(() {
                  numeroDado = Random().nextInt(6) + 1; // 1 - 6;
                });
              },
              child: const Text(
                'Lanzar',
                style: TextStyle(fontSize: 25),
              ),
            ),
          ],
        )),
      ),
    );
  }
}
