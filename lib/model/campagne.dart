import 'package:cloud_firestore/cloud_firestore.dart';

class Campagne {
  String titre;
  DateTime dateDebut, dateFin;
  String description;
  List<String> territoire;
  List<String> groupesTaxonomiques;
  List<int> fiches;

  Campagne({required this.titre,
    required this.dateDebut,
    required this.dateFin,
    required this.description,
    required this.territoire,
    required this.groupesTaxonomiques,
    required this.fiches});

  factory Campagne.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> snapshot,
      SnapshotOptions? options) {
    final data = snapshot.data()!;
    return Campagne(
      titre: data['titre'],
      dateDebut: data['dateDebut'],
      dateFin: data['dateFin'],
      description: data['description'],
      territoire: data['territoire'],
      groupesTaxonomiques: data['groupesTaxonomiques'],
      fiches: data['fiches'],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      "titre": titre,
      "dateDebut": dateDebut,
      "dateFin": dateFin,
      "description": description,
      "territoire": territoire,
      "groupesTaxonomiques": groupesTaxonomiques,
      "fiches": fiches,
    };
  }
}
