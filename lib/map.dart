import 'package:flutter/material.dart';

void main() {
  runApp(const Map());
}

class Map extends StatefulWidget{
  const Map({super.key});

  @override
  State<Map> createState() => _MapState();

}

class _MapState extends State<Map>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Liste des campagnes"),
      ),
      body: Column(

      ),
    );
  }

}

