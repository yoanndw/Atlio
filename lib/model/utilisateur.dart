import 'dart:core';
import 'package:cloud_firestore/cloud_firestore.dart';

class Utilisateur {
  String? id;
  String email;
  String nom;
  List<String> territoire;

  Utilisateur(
      {this.id, required this.email, required this.nom, this.territoire = const []});

  factory Utilisateur.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    return Utilisateur(
      id: snapshot.reference.id,
      email: data?['email'],
      nom: data?['nom'],
      territoire: data?['territoire'],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      if (id != null) "id": id,
      "email": email,
      "nom": nom,
      "territoire": territoire,
    };
  }
}
