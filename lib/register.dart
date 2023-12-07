import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project_ofb/model/appModel.dart';
import 'package:project_ofb/model/utilisateur.dart';
import 'package:provider/provider.dart';

class Register extends StatefulWidget {
  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _formKey = GlobalKey<FormState>();

  String? _name, _email, _password;

  void _insertUser() {
    final user = Utilisateur(email: _email!, nom: _name!);
    FirebaseFirestore.instance
        .collection('users')
        .add(user.toFirestore())
        .then((value) {
      print('Inserted user $user.');
      Navigator.popUntil(
          context, (route) => route.isFirst); // First page is the home
    });
  }

  void _register() async {
    try {
      UserCredential uc = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: _email!, password: _password!);

      Provider.of<AppModel>(context, listen: false).login(uc);

      _insertUser();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('REGISTERING ERROR: Weak password: $e');
      } else if (e.code == 'email-already-in-use') {
        print('REGISTERING ERROR: Email already used: $e');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text('Créer un compte')),
      body: Container(
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
                  child: Text('Bienvenue ! 👋'),
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
                        labelText: "Nom",
                        hintStyle: TextStyle(color: Colors.black87),
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 16.0),
                        // Ajustez ces valeurs pour décaler le texte
                        border: InputBorder.none,
                      ),
                      onChanged: (v) {
                        setState(() {
                          _name = v;
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
                  padding:
                      const EdgeInsets.symmetric(vertical: 16, horizontal: 30),
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
                // Mot de passe
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 16, horizontal: 30),
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
                // Bouton
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 50, horizontal: 30),
                  child: SizedBox(
                    width: double.infinity, // <-- match_parent
                    // height: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12), // <-- Radius
                        ),
                      ),
                      onPressed: () {
                        // Validate returns true if the form is valid, or false otherwise.
                        if (_formKey.currentState!.validate()) {
                          // If the form is valid, display a snackbar. In the real world,
                          // you'd often call a server or save the information in a database.
                          _register();
                        }
                      },
                      child: const Text('Inscription'),
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
