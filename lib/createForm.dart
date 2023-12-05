import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';

//import 'package:camera/camera.dart';
import 'package:geocoding/geocoding.dart';

class CreateForm extends StatefulWidget {
  const CreateForm({super.key});

  @override
  State<CreateForm> createState() => _CreateFormState();
}

class _CreateFormState extends State<CreateForm> with OSMMixinObserver {
  final _formKey = GlobalKey<FormState>();

  double? _lat, _lon;
  String? _lieu;
  final DateTime _dateHeure = DateTime.timestamp();

  //List<XFile> _photos = [];
  String? _observation;
  int? _campagne, _utilisateur;

  List<Widget> _imagePreviews = [];

  final utilisateurs = [1, 2, 3];
  final campagne = 1;

  MapController controller = MapController(
    initPosition: GeoPoint(latitude: 48.083328, longitude: -1.68333),
    areaLimit: BoundingBox(
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
      // Ajustez ces valeurs pour décaler le texte
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
        body: Column(
          children: [
            Form(
                key: _formKey,
                child: Column(children: [
                  TextFormField(
                    decoration: myInputDecoration("Entrez votre observation"),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Veuillez entrer une observation';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      // Callback appelé à chaque modification de texte
                    },
                  ),
                  ElevatedButton(
                    onPressed: _pickImages,
                    child: const Text('Select images'),
                  ),
                  // Afficher les aperçus des images sélectionnées
                  if (_imagePreviews.isNotEmpty)
                    SingleChildScrollView(
                      child: SizedBox(
                        height: 100,
                        width: screenSize.width / 2,
                        child: GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            // Nombre de colonnes dans la grille
                            crossAxisSpacing: 8.0,
                            // Espacement horizontal entre les éléments de la grille
                            mainAxisSpacing:
                                8.0, // Espacement vertical entre les éléments de la grille
                          ),
                          itemCount: _imagePreviews.length,
                          itemBuilder: (context, index) {
                            return _imagePreviews[index];
                          },
                        ),
                      ),
                    ),
                  SizedBox(
                      height: screenSize.height / 1.5,
                      width: screenSize.width / 1.5,
                      child: OSMFlutter(
                          controller: controller,
                          osmOption: OSMOption(
                            userTrackingOption: const UserTrackingOption(
                              enableTracking: true,
                              unFollowUser: false,
                            ),
                            zoomOption: const ZoomOption(
                              initZoom: 8,
                              minZoomLevel: 3,
                              maxZoomLevel: 19,
                              stepZoom: 1.0,
                            ),
                            userLocationMarker: UserLocationMaker(
                              personMarker: const MarkerIcon(
                                icon: Icon(
                                  Icons.location_history_rounded,
                                  color: Colors.red,
                                  size: 48,
                                ),
                              ),
                              directionArrowMarker: const MarkerIcon(
                                icon: Icon(
                                  Icons.double_arrow,
                                  size: 48,
                                ),
                              ),
                            ),
                            roadConfiguration: const RoadOption(
                              roadColor: Colors.yellowAccent,
                            ),
                            markerOption: MarkerOption(
                                defaultMarker: const MarkerIcon(
                              icon: Icon(
                                Icons.person_pin_circle,
                                color: Colors.blue,
                                size: 56,
                              ),
                            )),
                          ))),
                ])),
          ],
        ));
  }

  @override
  Future<void> mapIsReady(bool isReady) {
    throw UnimplementedError();
  }

  @override
  void onSingleTap(GeoPoint position) {
    super.onSingleTap(position);
    if (_lat != null) {
      controller.removeMarker(GeoPoint(latitude: _lat!, longitude: _lon!));
    }
    _lat = position.latitude;
    _lon = position.longitude;
    controller.addMarker(
        GeoPoint(latitude: position.latitude, longitude: position.longitude));
  }

  Future<void> _pickImages() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg', 'png', 'jpeg'],
      allowMultiple: true,
    );

    if (result != null && result.files.isNotEmpty) {
      // L'utilisateur a sélectionné des images, vous pouvez traiter les fichiers ici
      _imagePreviews.clear(); // Effacer les aperçus précédents

      for (PlatformFile file in result.files) {
        // Créer un aperçu de l'image
        _imagePreviews.add(
          Image.memory(file.bytes!, width: 100, height: 100),
        );
      }
    }

    setState(
        () {}); // Rafraîchir l'interface pour afficher les nouveaux aperçus
  }
}
