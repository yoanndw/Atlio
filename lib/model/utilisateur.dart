import 'dart:core';
import 'package:cloud_firestore/cloud_firestore.dart';

class Utilisateur {
  String? id;
  String email;
  String nom;

  Utilisateur(
      {this.id, required this.email, required this.nom});

  factory Utilisateur.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    return Utilisateur(
      id: snapshot.reference.id,
      email: data?['email'],
      nom: data?['nom'],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      "email": email,
      "nom": nom,
    };
  }
}
