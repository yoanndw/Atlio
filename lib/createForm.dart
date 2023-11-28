import 'package:flutter/material.dart';
import 'package:project_ofb/homePage.dart';

void main() {
  runApp(const CreateForm());
}

class CreateForm extends StatefulWidget{
  const CreateForm({super.key});

  @override
  State<CreateForm> createState() => _CreateFormState();

}

class _CreateFormState extends State<CreateForm>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Création d'une nouvelle fiche."),
      ),
      body: Column(

      ),
    );
  }

}

