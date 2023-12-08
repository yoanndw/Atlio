import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';

class Fiche {
  String? id;
  Map<String, double> positionGps; // { "lat": X, "lon": Y }
  String lieu;
  DateTime dateHeure;
  List<Uint8List> photos = [];
  String? observation;
  String campagne, utilisateur;

  Fiche(
      {this.id,
      required this.campagne,
      required this.utilisateur,
      required this.positionGps,
      required this.lieu,
      required this.dateHeure,
      required this.photos,
      this.observation});

  factory Fiche.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    return Fiche(
      id: snapshot.reference.id,
      campagne: data?['campagne'],
      utilisateur: data?['utilisateur'],
      positionGps: Map<String, double>.from(data?['positionGps']),
      lieu: data?['lieu'],
      dateHeure: (data?['dateHeure'] as Timestamp).toDate(),
      photos: data?['photos'] is Iterable ? List.from(data?['photos']) : [],
      observation: data?['observation'],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      "campagne": campagne,
      "utilisateur": utilisateur,
      "positionGps": positionGps,
      "lieu": lieu,
      "dateHeure": Timestamp.fromDate(dateHeure),
      "photos": photos,
      "observation": observation,
    };
  }
}
