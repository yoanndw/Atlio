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
import '../model/constants.dart';

class Menu extends StatefulWidget {
  @override
  State<Menu> createState() => _MenuState();

  final bool isMenuOpen;

  // Constructor
  Menu({Key? key, required bool this.isMenuOpen}) : super(key: key);

}

class _MenuState extends State<Menu> {

  Map<String, double> m = {"lat": 48.117266, "lon": -1.6777926};
  Map<String, double> m2 = {"lat": 48.117266, "lon": -1.1777926};
  final _formKey = GlobalKey<FormState>();
  UserCredential? _user;

  void _logout() async {
    try {
      await FirebaseAuth.instance.signOut();

      Provider.of<AppModel>(context, listen: false).logout();
    } on FirebaseAuthException catch (e) {
      print("Error signing out: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    _user = Provider.of<AppModel>(context, listen:false).loggedUser;
    Size screenSize = MediaQuery.of(context).size;
    return Stack(children: [
      if (this.widget.isMenuOpen)
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
                  Consumer<AppModel>(builder: (context, app, child) {
                    if (_user == null) return SizedBox.shrink();

                    return Padding(
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
                    );
                  }),
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
                                Fiche(
                                    utilisateur: "Robert Chapeau",
                                    campagne: '',
                                    positionGps: m2,
                                    lieu: 'Auray la rue',
                                    dateHeure: DateTime(2019),
                                    photos: ["assets/fox.png"],
                                    observation:
                                    "Une 2e petite observation très peu complète malheureusement Une petite observation très peu complète"),
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