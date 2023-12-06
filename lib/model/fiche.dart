import 'package:cloud_firestore/cloud_firestore.dart';

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

  factory Fiche.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    return Fiche(
      campagne: data?['campagne'],
      utilisateur: data?['utilisateur'],
      positionGps: Map<String, double>.from(data?['positionGps']),
      lieu: data?['lieu'],
      dateHeure: (data?['dateHeure'] as Timestamp).toDate(),
      photos: data?['photos'] is Iterable ? List.from(data?['photos']) : [],
      observation: data?['observation'],
      user: data?['user'],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      "campagneName": campagneName,
      "campagne": campagne,
      "utilisateur": utilisateur,
      "positionGps": positionGps,
      "lieu": lieu,
      "dateHeure": Timestamp.fromDate(dateHeure),
      "photos": photos,
      "observation": observation,
      "user": user,
    };
  }
}
