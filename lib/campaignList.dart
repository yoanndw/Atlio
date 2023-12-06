import 'package:flutter/material.dart';
import 'package:project_ofb/widgets/displayCampaign.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text("Liste des campagnes"),
        ),
        body: Container(
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
                )),
                DisplayCampaign(
                    campagne: Campagne(
                  titre: "Camp 1",
                  dateDebut: DateTime(2017),
                  dateFin: DateTime(2018),
                  description: "Bonjour description",
                  territoire: ["Rennes, Paris"],
                  groupesTaxonomiques: ["Renards", "Abeilles"],
                )),
                DisplayCampaign(
                    campagne: Campagne(
                  titre: "Camp 1",
                  dateDebut: DateTime(2017),
                  dateFin: DateTime(2018),
                  description: "Bonjour description",
                  territoire: ["Rennes, Paris"],
                  groupesTaxonomiques: ["Renards", "Abeilles"],
                )),
                DisplayCampaign(
                    campagne: Campagne(
                  titre: "Camp 1",
                  dateDebut: DateTime(2017),
                  dateFin: DateTime(2018),
                  description: "Bonjour description",
                  territoire: ["Rennes, Paris"],
                  groupesTaxonomiques: ["Renards", "Abeilles"],
                )),
                DisplayCampaign(
                    campagne: Campagne(
                  titre: "Camp 1",
                  dateDebut: DateTime(2017),
                  dateFin: DateTime(2018),
                  description: "Bonjour description",
                  territoire: ["Rennes, Paris"],
                  groupesTaxonomiques: ["Renards", "Abeilles"],
                )),
                DisplayCampaign(
                    campagne: Campagne(
                  titre: "Camp 1",
                  dateDebut: DateTime(2017),
                  dateFin: DateTime(2018),
                  description: "Bonjour description",
                  territoire: ["Rennes, Paris"],
                  groupesTaxonomiques: ["Renards", "Abeilles"],
                )),
                DisplayCampaign(
                    campagne: Campagne(
                  titre: "Camp 1",
                  dateDebut: DateTime(2017),
                  dateFin: DateTime(2018),
                  description: "Bonjour description",
                  territoire: ["Rennes, Paris"],
                  groupesTaxonomiques: ["Renards", "Abeilles"],
                )),
                DisplayCampaign(
                    campagne: Campagne(
                  titre: "Camp 1",
                  dateDebut: DateTime(2017),
                  dateFin: DateTime(2018),
                  description: "Bonjour description",
                  territoire: ["Rennes, Paris"],
                  groupesTaxonomiques: ["Renards", "Abeilles"],
                )),
                DisplayCampaign(
                    campagne: Campagne(
                  titre: "Camp 1",
                  dateDebut: DateTime(2017),
                  dateFin: DateTime(2018),
                  description: "Bonjour description",
                  territoire: ["Rennes, Paris"],
                  groupesTaxonomiques: ["Renards", "Abeilles"],
                )),
                DisplayCampaign(
                    campagne: Campagne(
                  titre: "Camp 1",
                  dateDebut: DateTime(2017),
                  dateFin: DateTime(2018),
                  description: "Bonjour description",
                  territoire: ["Rennes, Paris"],
                  groupesTaxonomiques: ["Renards", "Abeilles"],
                )),
              ],
            ),
          ),
        ));
  }
}
