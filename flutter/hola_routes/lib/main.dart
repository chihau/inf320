import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Screen1(),
    );
  }
}

class Screen1 extends StatelessWidget {
  Screen1({super.key});

  final myController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hola Routes - Screen 1'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Ingresa tu nombre',
                ),
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 25),
                controller: myController,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Screen2(),
                      settings: RouteSettings(arguments: myController.text),
                    ),
                  );
                },
                child: const Text('Ir a Screen 2'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Screen2 extends StatelessWidget {
  const Screen2({super.key});

  @override
  Widget build(BuildContext context) {
    // ? significa que puede ser null
    // ! significa que estamos seguros que no es null (sino lanzará una excepción)
    String nombre = ModalRoute.of(context)?.settings.arguments as String;

    print("Argument: $nombre");

    return Scaffold(
      appBar: AppBar(
        title: const Text('Hola Routes - Screen 2'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Hola $nombre',
              style: const TextStyle(fontSize: 25),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Volver'),
            ),
          ],
        ),
      ),
    );
  }
}
