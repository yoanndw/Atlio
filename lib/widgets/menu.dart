import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project_ofb/homePage.dart';
import 'package:project_ofb/model/fiche.dart';
import 'package:project_ofb/profile.dart';
import 'package:project_ofb/widgets/authentification.dart';
import 'package:provider/provider.dart';

import '../campaignList.dart';
import '../createCampaign.dart';
import '../map.dart';
import '../model/appModel.dart';

class Menu extends StatelessWidget {
  final double minFieldWidth = 300.0;
  final bool isMenuOpen;
  UserCredential? _user;
  final _formKey = GlobalKey<FormState>();

  // Constructor
  Menu({Key? key, required bool this.isMenuOpen}) : super(key: key);

  Map<String, double> m = {"lat": 48.117266, "lon": -1.6777926};

  void _logout() async {
    try {
      await FirebaseAuth.instance.signOut();
    } on FirebaseAuthException catch (e) {
      print("Error signing out: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    _user = Provider.of<AppModel>(context).loggedUser;
    Size screenSize = MediaQuery.of(context).size;
    return Stack(children: [
      if (this.isMenuOpen)
        Container(
          width: (screenSize.width / 5 < minFieldWidth)
              ? minFieldWidth
              : screenSize.width / 5,
          child: Drawer(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(0.0),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(children: [
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: ListTile(
                      title: DefaultTextStyle.merge(
                        style: const TextStyle(fontWeight: FontWeight.w500),
                        child: Text("Accueil"),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const HomePage()),
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: ListTile(
                      title: DefaultTextStyle.merge(
                        style: const TextStyle(fontWeight: FontWeight.w500),
                        child: Text("Campagnes"),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const CampaignList()),
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: ListTile(
                      title: DefaultTextStyle.merge(
                        style: const TextStyle(fontWeight: FontWeight.w500),
                        child: Text("Nouvelle campagne"),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const CreateCampaign()),
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: ListTile(
                      title: const Text('MAP'),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CampagneMap(fiches: [
                                Fiche(
                                    utilisateur: "Robert Chapeau",
                                        campagne: '',
                                        positionGps: m,
                                        lieu: 'Auray la street',
                                        dateHeure: DateTime(2017),
                                        photos: ["assets/fleur.png"],
                                        observation:
                                            "Une petite observation très peu complète malheureusement Une petite observation très peu complète"),
                                  ])),
                        );
                      },
                    ),
                  ),
                ]),
                Consumer<AppModel>(builder: (context, app, child) {
                  if (app.loggedUser == null) {
                    return Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: ListTile(
                            leading: Icon(Icons.login_outlined),
                            title: DefaultTextStyle.merge(
                              style:
                                  const TextStyle(fontWeight: FontWeight.w500),
                              child: Text("Connexion"),
                            ),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const Authentification()),
                              );
                            },
                          ),
                        ),
                      ],
                    );
                  } else {
                    return Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: ListTile(
                            leading: Icon(Icons.account_circle_outlined),
                            title: DefaultTextStyle.merge(
                              style:
                                  const TextStyle(fontWeight: FontWeight.w500),
                              child: Text("Profil"),
                            ),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Profile()),
                              );
                            },
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: ListTile(
                            iconColor: Colors.red,
                            leading: Icon(Icons.logout_outlined),
                            title: DefaultTextStyle.merge(
                              style: const TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.red,
                              ),
                              child: Text("Déconnexion"),
                            ),
                            onTap: () {
                              // Validate returns true if the form is valid, or false otherwise.

                              // If the form is valid, display a snackbar. In the real world,
                              // you'd often call a server or save the information in a database.
                              _logout();
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const HomePage()),
                              );
                            },
                          ),
                        )
                      ],
                    );
                  }
                })
              ],
            ),
          ),
        )
    ]);
  }
}
