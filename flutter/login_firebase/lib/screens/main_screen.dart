import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login_firebase/screens/login_screen.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Login Firebase"),
          backgroundColor: Colors.red,
          actions: [
            IconButton(
              icon: Icon(Icons.logout),
              onPressed: () {
                FirebaseAuth.instance.signOut().then((value) {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: ((context) => LoginScreen()),
                      ));
                });
              },
            ),
          ]),
      body: Center(
        child: Text("Main Screen"),
      ),
    );
  }
}
