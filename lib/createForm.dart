import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:geocoding/geocoding.dart';

class CreateForm extends StatefulWidget {
  const CreateForm({super.key});

  @override
  State<CreateForm> createState() => _CreateFormState();
}

class _CreateFormState extends State<CreateForm> {
  final _formKey = GlobalKey<FormState>();

  double? _lat, _lon;
  String? _lieu;
  final DateTime _dateHeure = DateTime.timestamp();
  List<XFile> _photos = [];
  String? _observation;
  int? _campagne, _utilisateur;

  final utilisateurs = [1, 2, 3];
  final campagne = 1;

  @override
  void initState() {
    super.initState();
  }

  void _updateLocation() async {
    final lieux = await placemarkFromCoordinates(_lat!, _lon!);
    setState(() {
      _lieu = lieux[0].toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Création d'une nouvelle fiche."),
      ),
      body: Form(
          key: _formKey,
          child: Column(children: [
            TextFormField(
                decoration: const InputDecoration(hintText: 'Latitude'),
                onChanged: (v) {
                  setState(() {
                    _lat = double.tryParse(v);
                    print('update lat $_lat');
                  });
                }),
            TextFormField(
                decoration: const InputDecoration(hintText: 'Longitude'),
                onChanged: (v) {
                  setState(() {
                    _lon = double.tryParse(v);
                    print('update lon $_lon');
                  });
                }),
            Text('Lieu: $_lieu'),
            TextFormField(
                decoration: const InputDecoration(hintText: 'Observations'),
                onChanged: (v) {
                  setState(() {
                    _observation = v;
                  });
                }),
            DropdownMenu<int>(
              dropdownMenuEntries: utilisateurs
                  .map((e) => DropdownMenuEntry(value: e, label: e.toString()))
                  .toList(),
              controller: TextEditingController(),
              onSelected: (v) {
                setState(() {
                  _utilisateur = v;
                });
              },
            ),
            ElevatedButton(onPressed: _updateLocation, child: Text('Mettre à jour lieu')),
          ])),
    );
  }
}
