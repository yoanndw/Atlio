import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AppModel extends ChangeNotifier {
  UserCredential? _loggedUser;

  UserCredential? get loggedUser => _loggedUser;

  void login(UserCredential uc) {
    _loggedUser = uc;
    notifyListeners();
  }

  void logout() {
    _loggedUser = null;
    notifyListeners();
  }
}