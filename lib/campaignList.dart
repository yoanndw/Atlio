import 'package:cloud_firestore/cloud_firestore.dart';
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
  List<Campagne>? _campaigns;

  @override
  void initState() {
    super.initState();

    FirebaseFirestore.instance.collection("campaigns").get().then((value) {
      setState(() {
        _campaigns =
            value.docs.map((e) {
              print('fetched ${e.data()}');
              return Campagne.fromFirestore(e, null);
            }).toList();
      });
    }).catchError((err) {
      print('[ERROR FETCHING DB] Could not load campaigns: $err');
    });
  }

  @override
  Widget build(BuildContext context) {
    ListView listView = (_campaigns == null)
        ? ListView()
        : ListView.builder(
        itemBuilder: (context, index) =>
            DisplayCampaign(campagne: _campaigns![index]),
        itemCount: _campaigns!.length);

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
          backgroundColor: Theme
              .of(context)
              .colorScheme
              .inversePrimary,
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
            height: MediaQuery
                .of(context)
                .size
                .height,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/fleur.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: listView,
          ),
          Menu(isMenuOpen: _isMenuOpen)
        ]));
  }
}
