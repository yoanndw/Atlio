import 'package:flutter/material.dart';
import 'package:project_ofb/createForm.dart';
import 'package:project_ofb/widgets/displayProfilesFiles.dart';
import 'package:project_ofb/widgets/menu.dart';
import 'package:provider/provider.dart';

import 'map.dart';
import 'model/appModel.dart';
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
    Map<String, double> m = {"lat": 48.117266, "lon": -1.6777926};
    Map<String, double> m2 = {"lat": 48.117266, "lon": -1.1777926};
    return Scaffold(
        floatingActionButton:
            Consumer<AppModel>(builder: (context, app, child) {
          if (app.loggedUser != null) {
            return FloatingActionButton(
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
            );
          } else {
            return Container(); // Permet de ne rien afficher
          }
        }),
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
                  // DisplayFiles(
                  //     fiche: Fiche(
                  //         utilisateur: "Robert Chapeau",
                  //         campagne: '',
                  //         positionGps: {},
                  //         lieu: 'Auray la street',
                  //         dateHeure: DateTime(2017),
                  //         photos: images,
                  //         observation:
                  //         "Une petite observation très peu complète malheureusement Une petite observation très peu complète malheureusement Une petite observation très peu complète malheureusement Une petite observation très peu complète malheureusement Une petite observation très peu complète malheureusement Une petite observation très peu complète malheureusement Une petite observation très peu complète malheureusement Une petite observation très peu complète malheureusement Une petite observation très peu complète malheureusement Une petite observation très peu complète malheureusement Une petite observation très peu complète malheureusement Une petite observation très peu complète malheureusement Une petite observation très peu complète malheureusement Une petite observation très peu complète malheureusement Une petite observation très peu complète malheureusement Une petite observation très peu complète malheureusement Une petite observation très peu complète malheureusement Une petite observation très peu complète malheureusement Une petite observation très peu complète malheureusement Une petite observation très peu complète malheureusement Une petite observation très peu complète malheureusement Une petite observation très peu complète malheureusement Une petite observation très peu complète malheureusement Une petite observation très peu complète malheureusement Une petite observation très peu complète malheureusement Une petite observation très peu complète malheureusement Une petite observation très peu complète malheureusement Une petite observation très peu complète malheureusement Une petite observation très peu complète malheureusement Une petite observation très peu complète malheureusement Une petite observation très peu complète malheureusement Une petite observation très peu complète malheureusement Une petite observation très peu complète malheureusement Une petite observation très peu complète malheureusement Une petite observation très peu complète malheureusement Une petite observation très peu complète malheureusement Une petite observation très peu complète malheureusement Une petite observation très peu complète malheureusement Une petite observation très peu complète malheureusement Une petite observation très peu complète malheureusement Une petite observation très peu complète malheureusement Une petite observation très peu complète malheureusement Une petite observation très peu complète malheureusement Une petite observation très peu complète malheureusement Une petite observation très peu complète malheureusement Une petite observation très peu complète malheureusement Une petite observation très peu complète malheureusement Une petite observation très peu complète malheureusement Une petite observation très peu complète malheureusement Une petite observation très peu complète malheureusement Une petite observation très peu complète malheureusement Une petite observation très peu complète malheureusement Une petite observation très peu complète malheureusement Une petite observation très peu complète malheureusement Une petite observation très peu complète malheureusement Une petite observation très peu complète malheureusement Une petite observation très peu complète malheureusement Une petite observation très peu complète malheureusement Une petite observation très peu complète malheureusement Une petite observation très peu complète malheureusement Une petite observation très peu complète malheureusement ")),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CampagneMap(
                                  fiches: [
                                    Fiche(
                                        utilisateur: "Robert Chapeau",
                                        campagne: '',
                                        positionGps: m,
                                        lieu: 'Auray la street',
                                        dateHeure: DateTime(2017),
                                        photos: [
                                          "https://static.apidae-tourisme.com/filestore/objets-touristiques/images/1/44/9513985-diaporama.jpg"
                                        ],
                                        observation:
                                            "Une petite observation très peu complète malheureusement Une petite observation très peu complète"),
                                    Fiche(
                                        utilisateur: "Robert Chapeau",
                                        campagne: '',
                                        positionGps: m2,
                                        lieu: 'Auray la rue',
                                        dateHeure: DateTime(2019),
                                        photos: ["assets/fox.png"],
                                        observation:
                                            "Une 2e petite observation très peu complète malheureusement Une petite observation très peu complète"),
                                  ],
                                )),
                      );
                    },
                    child: Text('Afficher la carte'),
                  ),
                  DisplayFiles(
                    fiche: Fiche(
                        utilisateur: "Robert Chapeau",
                        campagne: 'Ressourcement de biches',
                        positionGps: m,
                        lieu: 'Rennes',
                        dateHeure: DateTime(2017),
                        photos: [
                          "https://static.apidae-tourisme.com/filestore/objets-touristiques/images/1/44/9513985-diaporama.jpg"
                        ],
                        observation: "Une biche dans la forêt"),
                  ),
                  DisplayFiles(
                    fiche: Fiche(
                        utilisateur: "Camille Kaoliu",
                        campagne: 'Ressourcement de sangliers',
                        positionGps: m2,
                        lieu: 'Vitré',
                        dateHeure: DateTime(2019),
                        photos: [
                          "https://www.rustica.fr/images/sanglier-foret.jpg"
                        ],
                        observation: "Une biche dans la forêt"),
                  )
                ],
              ),
            ),
            Menu(isMenuOpen: _isMenuOpen),
          ],
        ));
  }
}
