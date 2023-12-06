import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project_ofb/authentification.dart';
import 'package:provider/provider.dart';

import 'package:project_ofb/login.dart';
import 'package:project_ofb/model/appModel.dart';
import 'model/fiche.dart';
import 'widgets/displayProfilesFiles.dart';

void main() {
  runApp(const Profile());
}

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  //TODO supprimer la liste
  List<String> images = List.filled(1, 'assets/profil.png');
  UserCredential? _user;

  @override
  Widget build(BuildContext context) {
    _user = Provider.of<AppModel>(context).loggedUser;
    final title = _user == null ? 'Connexion' : 'Mon compte';

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(title),
        ),
        body: SizedBox.expand(
            child: Container(
                // Set the background image
                height: MediaQuery.of(context).size.height,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/fox.png'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: SingleChildScrollView(child: Consumer<AppModel>(
                  builder: (context, app, child) {
                    if (app.loggedUser == null) {
                      return const Authentification();
                    }

                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 20, bottom: 10),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: Image.asset(
                              'assets/profil.png',
                              height: 100,
                              width: 100,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 0, bottom: 0),
                          child: DefaultTextStyle.merge(
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                            child: Text('Robert Chapeau'),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 40),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Column(
                                children: [
                                  DefaultTextStyle.merge(
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    child: Text('12'),
                                  ),
                                  DefaultTextStyle.merge(
                                    style: const TextStyle(
                                      color: Colors.white,
                                    ),
                                    child: Text('Fiches'),
                                  )
                                ],
                              ),
                              Column(
                                children: [
                                  DefaultTextStyle.merge(
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    child: Text('9'),
                                  ),
                                  DefaultTextStyle.merge(
                                    style: const TextStyle(
                                      color: Colors.white,
                                    ),
                                    child: Text('Campagnes'),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                        DisplayFiles(
                            fiche: Fiche(
                                user: "Robert Chapeau",
                                campagneName: 'Nom de campagne',
                                campagne: 0,
                                utilisateur: 0,
                                positionGps: {},
                                lieu: 'Auray la street',
                                dateHeure: DateTime(2017),
                                photos: images,
                                observation:
                                    "Une petite observation très peu complète malheureusement Une petite observation très peu complète malheureusement Une petite observation très peu complète malheureusement Une petite observation très peu complète malheureusement Une petite observation très peu complète malheureusement Une petite observation très peu complète malheureusement Une petite observation très peu complète malheureusement Une petite observation très peu complète malheureusement Une petite observation très peu complète malheureusement Une petite observation très peu complète malheureusement Une petite observation très peu complète malheureusement Une petite observation très peu complète malheureusement Une petite observation très peu complète malheureusement Une petite observation très peu complète malheureusement Une petite observation très peu complète malheureusement Une petite observation très peu complète malheureusement Une petite observation très peu complète malheureusement Une petite observation très peu complète malheureusement Une petite observation très peu complète malheureusement Une petite observation très peu complète malheureusement Une petite observation très peu complète malheureusement Une petite observation très peu complète malheureusement Une petite observation très peu complète malheureusement Une petite observation très peu complète malheureusement Une petite observation très peu complète malheureusement Une petite observation très peu complète malheureusement Une petite observation très peu complète malheureusement Une petite observation très peu complète malheureusement Une petite observation très peu complète malheureusement Une petite observation très peu complète malheureusement Une petite observation très peu complète malheureusement Une petite observation très peu complète malheureusement Une petite observation très peu complète malheureusement Une petite observation très peu complète malheureusement Une petite observation très peu complète malheureusement Une petite observation très peu complète malheureusement Une petite observation très peu complète malheureusement Une petite observation très peu complète malheureusement Une petite observation très peu complète malheureusement Une petite observation très peu complète malheureusement Une petite observation très peu complète malheureusement Une petite observation très peu complète malheureusement Une petite observation très peu complète malheureusement Une petite observation très peu complète malheureusement Une petite observation très peu complète malheureusement Une petite observation très peu complète malheureusement Une petite observation très peu complète malheureusement Une petite observation très peu complète malheureusement Une petite observation très peu complète malheureusement Une petite observation très peu complète malheureusement Une petite observation très peu complète malheureusement Une petite observation très peu complète malheureusement Une petite observation très peu complète malheureusement Une petite observation très peu complète malheureusement Une petite observation très peu complète malheureusement Une petite observation très peu complète malheureusement Une petite observation très peu complète malheureusement Une petite observation très peu complète malheureusement Une petite observation très peu complète malheureusement Une petite observation très peu complète malheureusement Une petite observation très peu complète malheureusement ")),
                        DisplayFiles(
                            fiche: Fiche(
                                user: "Robert Chapeau",
                                campagneName: 'Nom de campagne',
                                campagne: 0,
                                utilisateur: 0,
                                positionGps: {},
                                lieu: 'Auray la street',
                                dateHeure: DateTime(2017),
                                photos: images,
                                observation:
                                    "Une petite observation très peu complète malheureusement")),
                        // InkWell(
                        //   onTap: () {
                        //     // navigateSecondPage(EditImagePage());
                        //   },
                        //   // child: DisplayImage(
                        //   //   imagePath: user.image,
                        //   //   onPressed: () {},
                        //   // )
                        // ),
                      ],
                    );
                  },
                )))));
  }
}
