import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login_firebase/screens/main_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final emailField = TextFormField(
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          prefixIcon: const Icon(Icons.email),
          hintText: "Correo",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
      onChanged: (value) {
        emailController.text = value;
      },
    );

    final passwordField = TextFormField(
      obscureText: true,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          prefixIcon: const Icon(Icons.vpn_key),
          hintText: "Contraseña",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
      onChanged: (value) {
        passwordController.text = value;
      },
    );

    final loginButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: Colors.red,
      child: MaterialButton(
        child: const Text(
          "Iniciar Sesión",
          style: TextStyle(
            fontSize: 18,
            color: Colors.white,
          ),
        ),
        onPressed: () async {
          /*if (emailController.text == "test@gmail.com" &&
              passwordController.text == "test123") {
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => MainScreen()));
          } else {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text("Usuario y/o contraseña inválidos"),
              backgroundColor: Colors.redAccent,
            ));
          }*/

          try {
            final authResult =
                await FirebaseAuth.instance.signInWithEmailAndPassword(
              email: emailController.text,
              password: passwordController.text,
            );

            if (authResult.user != null) {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MainScreen(),
                  ));
            } else {
              throw Exception("User is null");
            }
          } catch (e) {
            print('Firebase Auth Exception: $e');
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text("Usuario y/o contraseña inválidos"),
              backgroundColor: Colors.redAccent,
            ));
          }
        },
      ),
    );

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.star,
                size: 120,
                color: Colors.red,
              ),
              SizedBox(
                height: 45,
              ),
              emailField,
              SizedBox(
                height: 25,
              ),
              passwordField,
              SizedBox(
                height: 35,
              ),
              loginButton,
            ],
          ),
        ),
      ),
    );
  }
}
