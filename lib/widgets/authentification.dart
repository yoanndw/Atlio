import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:project_ofb/model/appModel.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Home Page',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green.shade300),
        useMaterial3: true,
      ),
      home: const Authentification(),
    );
  }
}

class Authentification extends StatefulWidget {
  const Authentification({super.key});

  @override
  State<Authentification> createState() => _AuthentificationState();
}

class _AuthentificationState extends State<Authentification> {

  final _formKey = GlobalKey<FormState>();
  String _email = '', _password = '';

  void _login() async {
    try {
      var uc = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _email,
        password: _password,
      );

      print(
          '[LOGIN SUCCESS] ${_email}, ${_password} : Credential: $uc');
      Provider.of<AppModel>(context, listen: false).login(uc);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
      } else if (e.code == 'wrong-password') {
      } else {}
    }
  }

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
        return Container(
            // Set the background image
            height: MediaQuery.of(context).size.height,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/sunflower.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: Form(
              key: _formKey,
              child: Column(
                //crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  DefaultTextStyle.merge(
                    style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                    child: Text('Content de vous revoir ! 👋'),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 50, bottom: 16, left: 30, right: 30),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white54,
                        // Couleur de fond
                        border: Border.all(color: Colors.white),
                        // Couleur du trait
                        borderRadius:
                            BorderRadius.circular(10.0), // Coins arrondis
                      ),
                      child: TextFormField(
                        decoration: const InputDecoration(
                          labelText: "Adresse email",
                          hintStyle: TextStyle(color: Colors.black87),
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 16.0, vertical: 16.0),
                          // Ajustez ces valeurs pour décaler le texte
                          border: InputBorder.none,
                        ),
                        onChanged: (v) {
                          setState(() {
                            _email = v;
                          });
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Veuillez remplir ce champ';
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 16, horizontal: 30),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white54,
                        // Couleur de fond
                        border: Border.all(color: Colors.white),
                        // Couleur du trait
                        borderRadius:
                            BorderRadius.circular(10.0), // Coins arrondis
                      ),
                      child: TextFormField(
                        obscureText: true,
                        decoration: const InputDecoration(
                          labelText: "Mot de passe",
                          hintStyle: TextStyle(color: Colors.black87),
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 16.0, vertical: 16.0),
                          // Ajustez ces valeurs pour décaler le texte
                          border: InputBorder.none,
                        ),
                        onChanged: (v) {
                          setState(() {
                            _password = v;
                          });
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Veuillez remplir ce champ';
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 50, horizontal: 30),
                    child: SizedBox(
                      width: double.infinity, // <-- match_parent
                      // height: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(12), // <-- Radius
                          ),
                        ),
                        onPressed: () {
                          // Validate returns true if the form is valid, or false otherwise.
                          if (_formKey.currentState!.validate()) {
                            // If the form is valid, display a snackbar. In the real world,
                            // you'd often call a server or save the information in a database.
                            _login();
                          }
                        },
                        child: const Text('Connexion'),
                      ),
                    ),
                  ),
                ],
              ),
            ));
  }
}
