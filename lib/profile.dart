import 'package:flutter/material.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text("Robert Chapeau"),
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
                child: SingleChildScrollView(
                  child: Column(
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
                              campagneName: 'Nom de campagne',
                              campagne: 0,
                              utilisateur: 0,
                              positionGps: {},
                              lieu: '',
                              dateHeure: DateTime(2017),
                              photos: [])),
                      DisplayFiles(
                          fiche: Fiche(
                              campagneName: 'Nom de campagne',
                              campagne: 0,
                              utilisateur: 0,
                              positionGps: {},
                              lieu: '',
                              dateHeure: DateTime(2017),
                              photos: [])),
                      DisplayFiles(
                          fiche: Fiche(
                              campagneName: 'Nom de campagne',
                              campagne: 0,
                              utilisateur: 0,
                              positionGps: {},
                              lieu: '',
                              dateHeure: DateTime(2017),
                              photos: [])),
                      DisplayFiles(
                          fiche: Fiche(
                              campagneName: 'Nom de campagne',
                              campagne: 0,
                              utilisateur: 0,
                              positionGps: {},
                              lieu: '',
                              dateHeure: DateTime(2017),
                              photos: [])),
                      DisplayFiles(
                          fiche: Fiche(
                              campagneName: 'Nom de campagne',
                              campagne: 0,
                              utilisateur: 0,
                              positionGps: {},
                              lieu: '',
                              dateHeure: DateTime(2017),
                              photos: [])),
                      DisplayFiles(
                          fiche: Fiche(
                              campagneName: 'Nom de campagne',
                              campagne: 0,
                              utilisateur: 0,
                              positionGps: {},
                              lieu: '',
                              dateHeure: DateTime(2017),
                              photos: [])),
                      DisplayFiles(
                          fiche: Fiche(
                              campagneName: 'Nom de campagne',
                              campagne: 0,
                              utilisateur: 0,
                              positionGps: {},
                              lieu: '',
                              dateHeure: DateTime(2017),
                              photos: [])),
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
                  ),
                ))));
  }
}
