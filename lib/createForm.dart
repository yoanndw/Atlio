import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart' as osm;
import 'package:geocoding/geocoding.dart';

import 'package:project_ofb/formList.dart';
import 'package:project_ofb/model/fiche.dart';

class CreateForm extends StatefulWidget {
  const CreateForm({super.key});

  @override
  State<CreateForm> createState() => _CreateFormState();
}

class _CreateFormState extends State<CreateForm> with osm.OSMMixinObserver {
  final _formKey = GlobalKey<FormState>();

  double? _lat, _lon;
  String? _lieu;
  final DateTime _dateHeure = DateTime.timestamp();

  String? _observation;
  int? _campagne, _utilisateur;

  List<Widget> _imagePreviews = [];

  bool _isMapVisible = true; // État pour suivre la visibilité de la carte

  final double minFieldWidth = 300.0;

  final utilisateurs = [1, 2, 3];
  final campagne = 1;

  osm.MapController controller = osm.MapController(
    initPosition: osm.GeoPoint(latitude: 48.083328, longitude: -1.68333),
    areaLimit: osm.BoundingBox(
      east: 10.4922941,
      north: 47.8084648,
      south: 45.817995,
      west: 5.9559113,
    ),
  );

  @override
  void initState() {
    controller.addObserver(this);
    super.initState();
  }

  void _updateLocation() async {
    final lieux = await placemarkFromCoordinates(_lat!, _lon!);
    setState(() {
      _lieu = lieux[0].toString();
    });
  }

  InputDecoration myInputDecoration(String hintText) {
    return InputDecoration(
      hintText: hintText,
      hintStyle: const TextStyle(color: Colors.black87),
      contentPadding:
          const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
      border: InputBorder.none,
    );
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Création d'une nouvelle fiche."),
      ),
      body: Container(
        // Set the background image
        height: screenSize.height,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/savane.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Align(
              alignment: Alignment.center,
              child: Column(
                children: [
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white70,
                            border: Border.all(color: Colors.black),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          width: (screenSize.width / 2 < minFieldWidth)
                              ? minFieldWidth
                              : screenSize.width / 2,
                          height: 200,
                          child: SingleChildScrollView(
                            child: TextFormField(
                              decoration:
                                  myInputDecoration("Entrez votre observation"),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Veuillez entrer une observation';
                                }
                                return null;
                              },
                              maxLines: null,
                              onChanged: (value) {},
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        ElevatedButton(
                          onPressed: _pickImages,
                          child: const Text('Select images'),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        if (_imagePreviews.isNotEmpty)
                          SingleChildScrollView(
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white70,
                                border: Border.all(color: Colors.black),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              height: 200,
                              width: (screenSize.width / 2 < minFieldWidth)
                                  ? minFieldWidth
                                  : screenSize.width / 2,
                              child: GridView.builder(
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3,
                                  crossAxisSpacing: 4.0,
                                  mainAxisSpacing: 4.0,
                                ),
                                itemCount: _imagePreviews.length,
                                itemBuilder: (context, index) {
                                  return _imagePreviews[index];
                                },
                              ),
                            ),
                          ),
                        const SizedBox(
                          height: 16,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              _isMapVisible = !_isMapVisible;
                            });
                          },
                          child: Text(_isMapVisible
                              ? 'Masquer la carte'
                              : 'Afficher la carte'),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        if (_isMapVisible)
                          Container(
                              decoration: BoxDecoration(
                                color: Colors.white70,
                                border: Border.all(color: Colors.black),
                                borderRadius: BorderRadius.circular(0.0),
                              ),
                              height: (screenSize.width / 2 < minFieldWidth)
                                  ? minFieldWidth
                                  : screenSize.width / 2,
                              width: (screenSize.width / 2 < minFieldWidth)
                                  ? minFieldWidth
                                  : screenSize.width / 2,
                              child: osm.OSMFlutter(
                                controller: controller,
                                osmOption: osm.OSMOption(
                                  userTrackingOption: const osm.UserTrackingOption(
                                    enableTracking: true,
                                    unFollowUser: false,
                                  ),
                                  zoomOption: const osm.ZoomOption(
                                    initZoom: 8,
                                    minZoomLevel: 3,
                                    maxZoomLevel: 19,
                                    stepZoom: 1.0,
                                  ),
                                  userLocationMarker: osm.UserLocationMaker(
                                    personMarker: const osm.MarkerIcon(
                                      icon: Icon(
                                        Icons.location_history_rounded,
                                        color: Colors.red,
                                        size: 48,
                                      ),
                                    ),
                                    directionArrowMarker: const osm.MarkerIcon(
                                      icon: Icon(
                                        Icons.double_arrow,
                                        size: 48,
                                      ),
                                    ),
                                  ),
                                  roadConfiguration: const osm.RoadOption(
                                    roadColor: Colors.yellowAccent,
                                  ),
                                  markerOption: osm.MarkerOption(
                                    defaultMarker: const osm.MarkerIcon(
                                      icon: Icon(
                                        Icons.person_pin_circle,
                                        color: Colors.blue,
                                        size: 56,
                                      ),
                                    ),
                                  ),
                                ),
                              )),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: Container(
        alignment: Alignment.bottomCenter,
        child: ElevatedButton(
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              if (_imagePreviews.isEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Veuillez sélectionner au moins une image.'),
                  ),
                );
              } else if (_lat == null || _lon == null) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text(
                        'Veuillez sélectionner une position sur la carte.'),
                  ),
                );
              } else {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const FormList()),
                );
              }
            }
          },
          child: const Text('Valider'),
        ),
      ),
    );
  }

  @override
  Future<void> mapIsReady(bool isReady) {
    throw UnimplementedError();
  }

  @override
  void onSingleTap(osm.GeoPoint position) {
    super.onSingleTap(position);
    if (_lat != null) {
      controller.removeMarker(osm.GeoPoint(latitude: _lat!, longitude: _lon!));
    }
    _lat = position.latitude;
    _lon = position.longitude;
    controller.addMarker(
        osm.GeoPoint(latitude: position.latitude, longitude: position.longitude));
  }

  Future<void> _pickImages() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg', 'png', 'jpeg'],
      allowMultiple: true,
    );

    if (result != null && result.files.isNotEmpty) {
      _imagePreviews.clear();
      for (PlatformFile file in result.files) {
        _imagePreviews.add(
          Image.memory(file.bytes!, width: 100, height: 100),
        );
      }
    }

    setState(() {});
  }

  void _insertForm(Fiche f) {
    FirebaseFirestore.instance
        .collection('forms')
        .add(f.toFirestore())
        .then((value) => print('Inserted campaign $value.'))
        .catchError(
            (err) => print('ERROR: Could not insert form $f: $err'));
  }
}
