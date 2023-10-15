import 'package:flutter/material.dart';

void main() {
  runApp(const Profile());
}

class Profile extends StatefulWidget{
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();

}

class _ProfileState extends State<Profile>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Profil"),
      ),
      body: Column(

      ),
    );
  }

}

