import 'package:camera/camera.dart';

class Fiche {
  Map<String, double> positionGps; // { "lat": X, "lon": Y }
  String lieu;
  DateTime dateHeure;
  List<XFile> photos = [];
  String? observation;
  int campagne, utilisateur;

  Fiche(
      {required this.campagne,
      required this.utilisateur,
      required this.positionGps,
      required this.lieu,
      required this.dateHeure,
      required this.photos,
      this.observation});
}
