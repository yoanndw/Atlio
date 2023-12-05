import 'package:flutter/material.dart';

import '../homePage.dart';
import '../model/campagne.dart';

class DisplayCampaign extends StatelessWidget {
  final Campagne campagne;
  final double minFieldWidth = 300.0;

  // Constructor
  const DisplayCampaign({
    Key? key,
    required this.campagne,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    // TODO Image image = campagne.fiches.isNotEmpty ? campagne.fiches.elementAt(0).pho.

    return SizedBox(
      width: (screenSize.width / 2 < minFieldWidth)
          ? minFieldWidth
          : screenSize.width / 2,
      child: ElevatedButton(
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
                builder: (context) => const HomePage(title: 'HomePage')),
          );
        },
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.insert_photo_outlined),
                      tooltip: 'Image')
                  // TODO child: Image.asset(
                  //   'assets/profil.png',
                  //   height: 75,
                  //   width: 75,
                  // ),
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
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    DefaultTextStyle.merge(
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                      child: Text(campagne.titre),
                    ),
                    Text(campagne.territoire.toString().substring(
                        1, campagne.territoire.toString().length - 1)),
                    Text(campagne.dateDebut.day.toString() +
                        "/" +
                        campagne.dateDebut.month.toString() +
                        "/" +
                        campagne.dateDebut.year.toString() +
                        " - " +
                        campagne.dateFin.day.toString() +
                        "/" +
                        campagne.dateFin.month.toString() +
                        "/" +
                        campagne.dateFin.year.toString())
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
