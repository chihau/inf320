import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future fetchAPI() async {
  final response =
      await http.get(Uri.parse('https://jsonplaceholder.typicode.com/todos'));

  if (response.statusCode == 200) {
    print(jsonDecode(response.body));
    return jsonDecode(response.body);
  } else {
    print("Server Error: ${response.statusCode}");
    return null;
  }
}

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  late Future futureJSON;

  @override
  void initState() {
    super.initState();
    futureJSON = fetchAPI();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Hola HTTP'),
        ),
        body: Center(
          child: FutureBuilder(
              future: futureJSON,
              builder: (context, snapshot) {
                print(snapshot.toString());
                if (snapshot.hasData) {
                  print("Data length: ${snapshot.data.length}");
                  return ListView.separated(
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(
                            snapshot.data[index]['title'],
                            style: const TextStyle(fontSize: 20),
                          ),
                          subtitle: Text(
                              "userId: ${snapshot.data[index]['userId']} - id: ${snapshot.data[index]['id']}"),
                          trailing: Icon(
                            snapshot.data[index]['completed']
                                ? Icons.check_circle
                                : Icons.done,
                            color: snapshot.data[index]['completed']
                                ? Colors.green
                                : Colors.grey,
                          ),
                        );
                      },
                      separatorBuilder: (context, index) =>
                          Divider(color: Colors.black),
                      itemCount: snapshot.data.length);
                }

                return CircularProgressIndicator();
              }),
        ),
      ),
    );
  }
}
