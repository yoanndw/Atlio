import 'package:flutter/material.dart';

import '../homePage.dart';
import '../model/campagne.dart';

class DisplayCampaign extends StatelessWidget {
  final Campagne campagne;

  // Constructor
  const DisplayCampaign({
    Key? key,
    required this.campagne,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO Image image = campagne.fiches.isNotEmpty ? campagne.fiches.elementAt(0).pho.

    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 0),
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
            MaterialPageRoute(builder: (context) => const HomePage()),
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
                  child: Text(campagne.titre),
                ),
                DefaultTextStyle.merge(
                  style: const TextStyle(
                    color: Colors.black87,
                  ),
                  child: Text(campagne.territoire
                      .toString()
                      .substring(1, campagne.territoire.toString().length - 1)),
                ),
                DefaultTextStyle.merge(
                  style: const TextStyle(
                    color: Colors.black87,
                  ),
                  child: Text(campagne.dateDebut.day.toString() +
                      "/" +
                      campagne.dateDebut.month.toString() +
                      "/" +
                      campagne.dateDebut.year.toString() +
                      " - " +
                      campagne.dateFin.day.toString() +
                      "/" +
                      campagne.dateFin.month.toString() +
                      "/" +
                      campagne.dateFin.year.toString()),
                ),
              ],
            )
          ],
        ));
  }
}
