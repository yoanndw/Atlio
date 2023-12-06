import 'dart:core';
import 'package:cloud_firestore/cloud_firestore.dart';

class Utilisateur {
  String nom;
  List<String> territoire;
  List<int> fiches;

  Utilisateur(
      {required this.nom, this.territoire = const [], this.fiches = const []});

  factory Utilisateur.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    return Utilisateur(
      nom: data?['nom'],
      territoire: data?['territoire'],
      fiches: data?['fiches'],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      "nom": nom,
      "territoire": territoire,
      "fiches": fiches,
    };
  }
}
