import 'package:flutter/material.dart';
import 'package:project_ofb/createCampaign.dart';
import 'package:project_ofb/widgets/displayCampaign.dart';
import 'package:project_ofb/widgets/menu.dart';
import 'package:provider/provider.dart';

import 'model/appModel.dart';
import 'model/campagne.dart';

void main() {
  runApp(const CampaignList());
}

class CampaignList extends StatefulWidget {
  const CampaignList({super.key});

  @override
  State<CampaignList> createState() => _CampaignListState();
}

class _CampaignListState extends State<CampaignList> {
  bool _isMenuOpen = false;

  @override
  Widget build(BuildContext context) {
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
                  MaterialPageRoute(builder: (context) => CreateCampaign()),
                );
              },
              tooltip: 'Créer une nouvelle campagne',
              child: Icon(Icons.add_outlined),
            );
          } else {
            return Container(); // Permet de ne rien afficher
          }
        }),
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text("Liste des campagnes"),
          leading: IconButton(
            onPressed: () {
              setState(() {
                _isMenuOpen = !_isMenuOpen;
              });
            },
            icon: const Icon(Icons.menu),
            tooltip: 'Menu',
          ),
        ),
        body: Stack(children: [
          Container(
            // Set the background image
            height: MediaQuery.of(context).size.height,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/fleur.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  DisplayCampaign(
                      campagne: Campagne(
                    titre: "Camp 1",
                    dateDebut: DateTime(2017),
                    dateFin: DateTime(2018),
                    description: "Bonjour description",
                    territoire: ["Rennes, Paris"],
                    groupesTaxonomiques: ["Renards", "Abeilles"],
                    utilisateur: 'uihkuh',
                  )),
                  // DisplayCampaign(
                  //     campagne: Campagne(
                  //   titre: "Camp 1",
                  //   dateDebut: DateTime(2017),
                  //   dateFin: DateTime(2018),
                  //   description: "Bonjour description",
                  //   territoire: ["Rennes, Paris"],
                  //   groupesTaxonomiques: ["Renards", "Abeilles"],
                  // )),
                  // DisplayCampaign(
                  //     campagne: Campagne(
                  //   titre: "Camp 1",
                  //   dateDebut: DateTime(2017),
                  //   dateFin: DateTime(2018),
                  //   description: "Bonjour description",
                  //   territoire: ["Rennes, Paris"],
                  //   groupesTaxonomiques: ["Renards", "Abeilles"],
                  // )),
                  // DisplayCampaign(
                  //     campagne: Campagne(
                  //   titre: "Camp 1",
                  //   dateDebut: DateTime(2017),
                  //   dateFin: DateTime(2018),
                  //   description: "Bonjour description",
                  //   territoire: ["Rennes, Paris"],
                  //   groupesTaxonomiques: ["Renards", "Abeilles"],
                  // )),
                  // DisplayCampaign(
                  //     campagne: Campagne(
                  //   titre: "Camp 1",
                  //   dateDebut: DateTime(2017),
                  //   dateFin: DateTime(2018),
                  //   description: "Bonjour description",
                  //   territoire: ["Rennes, Paris"],
                  //   groupesTaxonomiques: ["Renards", "Abeilles"],
                  // )),
                  // DisplayCampaign(
                  //     campagne: Campagne(
                  //   titre: "Camp 1",
                  //   dateDebut: DateTime(2017),
                  //   dateFin: DateTime(2018),
                  //   description: "Bonjour description",
                  //   territoire: ["Rennes, Paris"],
                  //   groupesTaxonomiques: ["Renards", "Abeilles"],
                  // )),
                  // DisplayCampaign(
                  //     campagne: Campagne(
                  //   titre: "Camp 1",
                  //   dateDebut: DateTime(2017),
                  //   dateFin: DateTime(2018),
                  //   description: "Bonjour description",
                  //   territoire: ["Rennes, Paris"],
                  //   groupesTaxonomiques: ["Renards", "Abeilles"],
                  // )),
                  // DisplayCampaign(
                  //     campagne: Campagne(
                  //   titre: "Camp 1",
                  //   dateDebut: DateTime(2017),
                  //   dateFin: DateTime(2018),
                  //   description: "Bonjour description",
                  //   territoire: ["Rennes, Paris"],
                  //   groupesTaxonomiques: ["Renards", "Abeilles"],
                  // )),
                  // DisplayCampaign(
                  //     campagne: Campagne(
                  //   titre: "Camp 1",
                  //   dateDebut: DateTime(2017),
                  //   dateFin: DateTime(2018),
                  //   description: "Bonjour description",
                  //   territoire: ["Rennes, Paris"],
                  //   groupesTaxonomiques: ["Renards", "Abeilles"],
                  // )),
                  // DisplayCampaign(
                  //     campagne: Campagne(
                  //   titre: "Camp 1",
                  //   dateDebut: DateTime(2017),
                  //   dateFin: DateTime(2018),
                  //   description: "Bonjour description",
                  //   territoire: ["Rennes, Paris"],
                  //   groupesTaxonomiques: ["Renards", "Abeilles"],
                  // )),
                ],
              ),
            ),
          ),
          Menu(isMenuOpen: _isMenuOpen)
        ]));
  }
}
