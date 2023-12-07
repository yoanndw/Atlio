import 'package:cloud_firestore/cloud_firestore.dart';

class Campagne {
  String? id;
  int user;
  String titre;
  DateTime dateDebut, dateFin;
  String description;
  List<String> territoire;
  List<String> groupesTaxonomiques;

  Campagne(
      {this.id,
      required this.user,
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
      user: data['user'],
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
      "user": user,
      "titre": titre,
      "dateDebut": dateDebut,
      "dateFin": dateFin,
      "description": description,
      "territoire": territoire,
      "groupesTaxonomiques": groupesTaxonomiques,
    };
  }
}
