import 'package:flutter/material.dart';

void main() {
  runApp(const FormList());
}

class FormList extends StatefulWidget{
  const FormList({super.key});

  @override
  State<FormList> createState() => _FormListState();

}

class _FormListState extends State<FormList>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Voici toutes les fiches de la campagne."),
      ),
      body: Column(

      ),
    );
  }

}

