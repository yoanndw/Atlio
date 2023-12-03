import 'package:flutter/material.dart';

class DisplayFiles extends StatelessWidget {
  //final Fiche fiche;
  final String campagnName;

  // Constructor
  const DisplayFiles({
    Key? key,
    //required this.fiche,
    required this.campagnName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(vertical: 5),
        decoration: BoxDecoration(
            //color: Theme.of(context).colorScheme.secondaryContainer,
            border: Border.symmetric(
                horizontal: BorderSide(color: Colors.grey.shade200, width: 1),
                vertical: BorderSide.none)),
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
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                  child: Text('Nom de la campagne'),
                ),
                Row(
                  children: [
                    Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Text("Lieu")),
                    Text("Date et heure")
                  ],
                )
              ],
            )
          ],
        ));
  }
}
