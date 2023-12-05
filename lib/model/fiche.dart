//import 'package:camera/camera.dart';

import 'dart:ui';

class Fiche {
  Map<String, double> positionGps; // { "lat": X, "lon": Y }
  String campagneName;
  String lieu;
  DateTime dateHeure;
  List<Image> photos = [];
  String? observation;
  int campagne, utilisateur;

  Fiche(
      {required this.campagneName,
      required this.campagne,
      required this.utilisateur,
      required this.positionGps,
      required this.lieu,
      required this.dateHeure,
      // TODO DECOMMENTER required this.photos,
      this.observation});
}
