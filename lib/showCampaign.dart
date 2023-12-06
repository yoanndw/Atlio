import 'package:flutter/material.dart';
import 'package:project_ofb/createForm.dart';
import 'package:project_ofb/widgets/displayProfilesFiles.dart';
import 'package:project_ofb/widgets/menu.dart';

import 'model/campagne.dart';
import 'model/fiche.dart';

class ShowCampaign extends StatefulWidget {
  final Campagne campagne;

  ShowCampaign({super.key, required Campagne this.campagne});

  @override
  State<ShowCampaign> createState() => _ShowCampaignState();
}

class _ShowCampaignState extends State<ShowCampaign> {
  bool _isMenuOpen = false;

  //TODO supprimer la liste
  List<String> images = List.filled(1, 'assets/profil.png');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(50))),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CreateForm()),
            );
          },
          tooltip: 'Créer une nouvelle fiche',
          child: Icon(Icons.add_outlined),
        ),
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              setState(() {
                _isMenuOpen = !_isMenuOpen;
              });
            },
            icon: const Icon(Icons.menu),
            tooltip: 'Menu',
          ),
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.campagne.titre),
        ),
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                      padding: EdgeInsets.only(left: 15, right: 15, top: 10),
                      child: Row(
                        children: [
                          Icon(Icons.room_outlined),
                          Text(widget.campagne.territoire.toString().substring(
                              1,
                              widget.campagne.territoire.toString().length - 1))
                        ],
                      )),
                  Padding(
                      padding: EdgeInsets.only(left: 15, right: 15, top: 10),
                      child: Row(
                        children: [
                          Icon(Icons.access_time_outlined),
                          Text(" " +
                              widget.campagne.dateDebut.day.toString() +
                              "/" +
                              widget.campagne.dateDebut.month.toString() +
                              "/" +
                              widget.campagne.dateDebut.year.toString() +
                              " - " +
                              widget.campagne.dateFin.day.toString() +
                              "/" +
                              widget.campagne.dateFin.month.toString() +
                              "/" +
                              widget.campagne.dateFin.year.toString())
                        ],
                      )),
                  Padding(
                      padding: EdgeInsets.only(left: 15, right: 15, top: 10),
                      child: Row(
                        children: [
                          Icon(Icons.group_work_outlined),
                          Text(widget.campagne.groupesTaxonomiques
                              .toString()
                              .substring(
                              1,
                              widget.campagne.groupesTaxonomiques
                                  .toString()
                                  .length -
                                  1))
                        ],
                      )),
                  Padding(
                    padding: EdgeInsets.only(left: 15, right: 15, top: 10),
                    child: Flexible(
                        child: Text(widget.campagne.description,
                            textAlign: TextAlign.justify)),
                  ),
                  // TODO supprimer la fiche est mettre une boucle foreach pour afficher la liste de fiches
                  DisplayFiles(
                      fiche: Fiche(
                          user: "Robert Chapeau",
                          campagne: 0,
                          utilisateur: 0,
                          positionGps: {},
                          lieu: 'Auray la street',
                          dateHeure: DateTime(2017),
                          photos: images,
                          observation:
                          "Une petite observation très peu complète malheureusement Une petite observation très peu complète malheureusement Une petite observation très peu complète malheureusement Une petite observation très peu complète malheureusement Une petite observation très peu complète malheureusement Une petite observation très peu complète malheureusement Une petite observation très peu complète malheureusement Une petite observation très peu complète malheureusement Une petite observation très peu complète malheureusement Une petite observation très peu complète malheureusement Une petite observation très peu complète malheureusement Une petite observation très peu complète malheureusement Une petite observation très peu complète malheureusement Une petite observation très peu complète malheureusement Une petite observation très peu complète malheureusement Une petite observation très peu complète malheureusement Une petite observation très peu complète malheureusement Une petite observation très peu complète malheureusement Une petite observation très peu complète malheureusement Une petite observation très peu complète malheureusement Une petite observation très peu complète malheureusement Une petite observation très peu complète malheureusement Une petite observation très peu complète malheureusement Une petite observation très peu complète malheureusement Une petite observation très peu complète malheureusement Une petite observation très peu complète malheureusement Une petite observation très peu complète malheureusement Une petite observation très peu complète malheureusement Une petite observation très peu complète malheureusement Une petite observation très peu complète malheureusement Une petite observation très peu complète malheureusement Une petite observation très peu complète malheureusement Une petite observation très peu complète malheureusement Une petite observation très peu complète malheureusement Une petite observation très peu complète malheureusement Une petite observation très peu complète malheureusement Une petite observation très peu complète malheureusement Une petite observation très peu complète malheureusement Une petite observation très peu complète malheureusement Une petite observation très peu complète malheureusement Une petite observation très peu complète malheureusement Une petite observation très peu complète malheureusement Une petite observation très peu complète malheureusement Une petite observation très peu complète malheureusement Une petite observation très peu complète malheureusement Une petite observation très peu complète malheureusement Une petite observation très peu complète malheureusement Une petite observation très peu complète malheureusement Une petite observation très peu complète malheureusement Une petite observation très peu complète malheureusement Une petite observation très peu complète malheureusement Une petite observation très peu complète malheureusement Une petite observation très peu complète malheureusement Une petite observation très peu complète malheureusement Une petite observation très peu complète malheureusement Une petite observation très peu complète malheureusement Une petite observation très peu complète malheureusement Une petite observation très peu complète malheureusement Une petite observation très peu complète malheureusement Une petite observation très peu complète malheureusement Une petite observation très peu complète malheureusement ")),
                ],
              ),
            ),
            Menu(isMenuOpen: _isMenuOpen),
          ],
        ));
  }
}
