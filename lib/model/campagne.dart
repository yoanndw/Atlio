import 'package:cloud_firestore/cloud_firestore.dart';

class Campagne {
  String? id;
  String utilisateur;
  String titre;
  DateTime dateDebut, dateFin;
  String description;
  List<String> territoire;
  List<String> groupesTaxonomiques;

  Campagne(
      {this.id,
      required this.utilisateur,
      required this.titre,
      required this.dateDebut,
      required this.dateFin,
      required this.description,
      required this.territoire,
      required this.groupesTaxonomiques});

  factory Campagne.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> snapshot,
      SnapshotOptions? options) {
    final data = snapshot.data()!;
    return Campagne(
      id: snapshot.reference.id,
      utilisateur: data['user'],
      titre: data['titre'],
      dateDebut: data['dateDebut'],
      dateFin: data['dateFin'],
      description: data['description'],
      territoire: data['territoire'],
      groupesTaxonomiques: data['groupesTaxonomiques'],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      if (id != null) "id": id,
      "user": utilisateur,
      "titre": titre,
      "dateDebut": dateDebut,
      "dateFin": dateFin,
      "description": description,
      "territoire": territoire,
      "groupesTaxonomiques": groupesTaxonomiques,
    };
  }
}
