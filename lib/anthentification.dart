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
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a blue toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue.shade900),
        useMaterial3: true,
      ),
      home: const Authentification(title: 'Authentification'),
    );
  }
}

class Authentification extends StatefulWidget {
  const Authentification({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<Authentification> createState() => _AuthentificationState();
}

class _AuthentificationState extends State<Authentification> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a `GlobalKey<FormState>`,
  // not a GlobalKey<MyCustomFormState>.
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme
            .of(context)
            .colorScheme
            .inversePrimary,
        title: const Text("Anthentification"),
      ),
      body: Form(
        key: _formKey,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
        Padding(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 30),
        child: TextFormField(
          // The validator receives the text that the user has entered.
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter some text';
            }
            return null;
          },
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 30),
        child: TextFormField(
            decoration: const InputDecoration(

            )
            // The validator receives the text that the user has entered.
            validator: (value) {
      if (value == null || value.isEmpty) {
      return 'Please enter some text';
      }
      return null;
      },
      ),
    ),
    Padding(
    padding: const EdgeInsets.symmetric(vertical: 85, horizontal: 40),
    child: ElevatedButton(
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
    ],
    ),)
    );
  }
}
