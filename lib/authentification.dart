import 'package:flutter/material.dart';

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
      home: const Authentification(title: 'Authentification'),
    );
  }
}

class Authentification extends StatefulWidget {
  const Authentification({super.key, required this.title});

  final String title;

  @override
  State<Authentification> createState() => _AuthentificationState();
}

class _AuthentificationState extends State<Authentification> {

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text("Authentification"),
        ),
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
                        decoration: InputDecoration(
                          labelText: "Nom d'utilisateur",
                          hintStyle: const TextStyle(color: Colors.black87),
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 16.0, vertical: 16.0),
                          // Ajustez ces valeurs pour décaler le texte
                          border: InputBorder.none,
                        ),
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
                        decoration: InputDecoration(
                          labelText: "Mot de passe",
                          hintStyle: const TextStyle(color: Colors.black87),
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 16.0, vertical: 16.0),
                          // Ajustez ces valeurs pour décaler le texte
                          border: InputBorder.none,
                        ),
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
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Processing Data')),
                            );
                          }
                        },
                        child: const Text('Connexion'),
                      ),
                    ),
                  ),
                ],
              ),
            )));
  }
}
