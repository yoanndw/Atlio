import 'package:cloud_firestore/cloud_firestore.dart';

class Campagne {
  String? id;
  String createur;
  String titre;
  DateTime dateDebut, dateFin;
  String description;
  List<String> territoire;
  List<String> groupesTaxonomiques;

  Campagne(
      {this.id,
      required this.createur,
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

    print('id: ${snapshot.reference.id}');
    print('createur: ${data['user']}');
    print('titre: ${data['titre']}');
    print('dateDebut: ${data['dateDebut']}');
    print('dateFin: ${data['dateFin']}');
    print('description: ${data['description']}');
    print('territoire: ${data['territoire']}');
    print('groupesTaxonomiques: ${data['groupesTaxonomiques']}');

    return Campagne(
      id: snapshot.reference.id,
      createur: data['user'],
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
      "createur": createur,
      "titre": titre,
      "dateDebut": dateDebut,
      "dateFin": dateFin,
      "description": description,
      "territoire": territoire,
      "groupesTaxonomiques": groupesTaxonomiques,
    };
  }
}
