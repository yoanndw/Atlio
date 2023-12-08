import 'package:flutter/material.dart';
import 'package:project_ofb/createForm.dart';
import 'package:project_ofb/widgets/menu.dart';
import 'package:provider/provider.dart';

import 'map.dart';
import 'model/appModel.dart';
import 'model/campagne.dart';

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
    Size screenSize = MediaQuery.of(context).size;

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
        body: Container(
    // Set the background image
    height: screenSize.height,
    decoration: const BoxDecoration(
    image: DecorationImage(
    image: AssetImage('assets/savane.png'),
    fit: BoxFit.cover,
    ),
    ), child :Stack(
          children: [
            SingleChildScrollView(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white70,
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(10.0),
                ),
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
                      ),
                    ),
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
                      ),
                    ),
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
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 10.0,
              right: 10.0,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CampagneMap(
                              fiches: [],
                            )),
                  );
                },
                child: Text('Afficher la carte'),
              ),
            ),
            Menu(isMenuOpen: _isMenuOpen),
          ],
        )),);
  }
}
