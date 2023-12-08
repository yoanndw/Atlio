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

  String getId() => id!;

  factory Campagne.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> snapshot,
      SnapshotOptions? options) {
    final data = snapshot.data()!;

    print('id: ${snapshot.reference.id}');
    print('createur: ${data['createur']}');
    print('titre: ${data['titre']}');
    print('dateDebut: ${data['dateDebut']}');
    print('dateFin: ${data['dateFin']}');
    print('description: ${data['description']}');
    print('territoire: ${data['territoire']}');
    print('groupesTaxonomiques: ${data['groupesTaxonomiques']}');

    return Campagne(
      id: snapshot.reference.id,
      createur: data['createur'],
      titre: data['titre'],
      dateDebut: (data['dateDebut'] as Timestamp).toDate(),
      dateFin: (data['dateFin'] as Timestamp).toDate(),
      description: data['description'],
      territoire: List.from(data['territoire']),
      groupesTaxonomiques: List.from(data['groupesTaxonomiques']),
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      "createur": createur,
      "titre": titre,
      "dateDebut": Timestamp.fromDate(dateDebut),
      "dateFin": Timestamp.fromDate(dateFin),
      "description": description,
      "territoire": territoire,
      "groupesTaxonomiques": groupesTaxonomiques,
    };
  }
}
