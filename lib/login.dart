import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  void _login() async {
    try {
      var uc = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );

      print('[LOGIN SUCCESS] ${_emailController.text}, ${_passwordController.text} : Credential: $uc');
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {

      } else if (e.code == 'wrong-password') {

      } else {

      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Connexion')),
      body: Column(
        children: [
          TextField(
            controller: _emailController,
            decoration: const InputDecoration(hintText: 'Adresse email'),
          ),
          TextField(
            controller: _passwordController,
            decoration: const InputDecoration(hintText: 'Mot de passe'),
          ),
          ElevatedButton(onPressed: _login, child: const Text('Se connecter'))
        ],
      )
    );
  }
}