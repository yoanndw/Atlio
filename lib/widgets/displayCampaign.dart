import 'package:flutter/material.dart';
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

    return Container(
      padding: EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
          border: Border.symmetric(
              horizontal: BorderSide(color: Colors.grey.shade200, width: 1),
              vertical: BorderSide.none)),
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
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
                child: Text(campagne.titre),
              ),
              Text(campagne.territoire
                  .toString()
                  .substring(1, campagne.territoire.toString().length - 1)),
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
      ),
    );
  }
}
