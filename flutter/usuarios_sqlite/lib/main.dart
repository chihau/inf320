import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

void main() async {
  runApp(const MainApp());
}

Future openMyDatabase() async {
  final dbPath = await getDatabasesPath();
  final path = join(dbPath, 'my_database.db');
  print(path);

  final database = await openDatabase(
    path,
    version: 3,
    onCreate: (db, version) {
      print('onCreate');
      db.execute("CREATE TABLE Usuarios (codigo INTEGER, nombre TEXT)");

      for (int i = 1; i <= 5; i++) {
        int codigo = i;
        String nombre = "Usuario $i";
        db.execute(
            "INSERT INTO Usuarios (codigo, nombre) VALUES ('$codigo', '$nombre')");
      }
    },
    onUpgrade: (db, oldVersion, newVersion) {
      print('onUpgrade');
      db.execute("DROP TABLE IF EXISTS Usuarios");
      db.execute("CREATE TABLE Usuarios (codigo INTEGER, nombre TEXT)");

      for (int i = 1; i <= 5; i++) {
        int codigo = i;
        String nombre = "Usuario $i";
        db.execute(
            "INSERT INTO Usuarios (codigo, nombre) VALUES ('$codigo', '$nombre')");
      }
    },
  );

  return database;
}

Future selectUsers() async {
  final db = await openMyDatabase();
  var list = await db.rawQuery("SELECT * FROM Usuarios");
  return list;
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Usuarios SQLite')),
        body: FutureBuilder(
          future: selectUsers(),
          builder: (context, snapshot) {
            //return Text(snapshot.data.toString());

            if (snapshot.hasData) {
              return ListView.separated(
                  itemBuilder: ((context, index) {
                    return ListTile(
                      title: Text(
                        snapshot.data[index]['nombre'],
                        style: TextStyle(fontSize: 20),
                      ),
                    );
                  }),
                  separatorBuilder: (context, index) =>
                      Divider(color: Colors.black),
                  itemCount: snapshot.data.length);
            } else {
              return CircularProgressIndicator();
            }
          },
        ),
      ),
    );
  }
}
