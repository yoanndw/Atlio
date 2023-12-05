import 'package:flutter/material.dart';

import '../homePage.dart';
import '../model/fiche.dart';

class DisplayFiles extends StatelessWidget {
  final Fiche fiche;

  // Constructor
  const DisplayFiles({
    Key? key,
    required this.fiche,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        textStyle: TextStyle(color: Colors.black87),
        backgroundColor: Colors.white54,
        // Couleur de fond
        side: const BorderSide(
          color: Colors.white,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0), // <-- Radius
        ),
      ),
      onPressed: () {
        // TODO changer la redirection
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => const HomePage(title: 'hahahaha')),
        );
      },
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Image.asset(
                'assets/profil.png',
                height: 75,
                width: 75,
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DefaultTextStyle.merge(
                style: const TextStyle(
                  color: Colors.black87,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
                child: Text('Nom de la campagne'),
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: DefaultTextStyle.merge(
                        style: const TextStyle(
                          color: Colors.black87,
                        ),
                        child: Text("Lieu")),
                  ),
                  DefaultTextStyle.merge(
                      style: const TextStyle(
                        color: Colors.black87,
                      ),
                      child: Text("Date et heure"))
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
