import 'package:flutter/material.dart';
import 'package:project_ofb/showForm.dart';

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
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 5),
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
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ShowForm(
                    fiche: fiche,
                  )),
        );
      },
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Container(
                  decoration: BoxDecoration(color: Colors.white70),
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Icon(Icons.insert_photo_outlined),
                  ),
                )
                // TODO Image.asset(
                //           'assets/profil.png',
                //           height: 75,
                //           width: 75,
                //         ),
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
                child: Text(fiche.campagne),
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: DefaultTextStyle.merge(
                        style: const TextStyle(
                          color: Colors.black87,
                        ),
                        child: Text(fiche.lieu)),
                  ),
                  DefaultTextStyle.merge(
                    style: const TextStyle(
                      color: Colors.black87,
                    ),
                    child: Text(fiche.dateHeure.day.toString() +
                        "/" +
                        fiche.dateHeure.month.toString() +
                        "/" +
                        fiche.dateHeure.year.toString()),
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
