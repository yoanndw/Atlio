

class Fiche {
  Map<String, double> positionGps; // { "lat": X, "lon": Y }
  String campagneName;
  String user;
  String lieu;
  DateTime dateHeure;
  List<String> photos = [];
  String observation;
  int campagne, utilisateur;

  Fiche(
      {required this.campagneName,
      required this.campagne,
      required this.utilisateur,
      required this.positionGps,
      required this.lieu,
      required this.dateHeure,
      required this.photos,
      required this.observation,
      required this.user});
}
