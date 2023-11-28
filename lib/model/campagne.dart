class Campagne {
  String titre;
  DateTime dateDebut, dateFin;
  String description;
  List<String> territoire;
  List<String> groupesTaxonomiques;
  List<int> fiches;

  Campagne(
      {required this.titre,
      required this.dateDebut,
      required this.dateFin,
      required this.description,
      required this.territoire,
      required this.groupesTaxonomiques,
      required this.fiches});
}
