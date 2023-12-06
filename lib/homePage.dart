import 'package:flutter/material.dart';
import 'package:project_ofb/campaignList.dart';
import 'package:project_ofb/createCampaign.dart';
import 'package:project_ofb/createForm.dart';
import 'package:project_ofb/map.dart';
import 'package:project_ofb/profile.dart';

import 'authentification.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green.shade300),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final double minFieldWidth = 300.0;
  bool _isMenuOpen = false;

  InputDecoration myInputDecoration(String hintText) {
    return InputDecoration(
      hintText: hintText,
      hintStyle: const TextStyle(color: Colors.black87),
      contentPadding:
          const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
      // Ajustez ces valeurs pour décaler le texte
      border: InputBorder.none,
    );
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
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
        title: Text("Accueil"),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Profile()),
              );
            },
            icon: const Icon(Icons.account_circle_rounded),
            tooltip: 'Profil',
          ),
        ],
      ),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/sunflower.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Align(
                alignment: Alignment.center,
                child: SizedBox(
                  width: (screenSize.width / 2 < minFieldWidth)
                      ? minFieldWidth
                      : screenSize.width / 2,
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Bienvenue sur ATLIO',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 60.0,
                          // Ajustez la taille du texte selon vos besoins
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 60),
                      Text(
                        'Votre atlas de biodiversité.',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30.0,
                          // Ajustez la taille du texte selon vos besoins
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Image.asset(
              'assets/logo.png',
              width: 100,
              height: 100,
            ),
          ),
          // if (!_isMenuOpen)
          //   Positioned(
          //     left: 18.0, // Ajustez la position horizontale à votre besoin
          //     top: 30.0, // Ajustez la position verticale à votre besoin
          //     child: IconButton(
          //       onPressed: () {
          //         setState(() {
          //           _isMenuOpen = !_isMenuOpen;
          //         });
          //       },
          //       icon: const Icon(
          //         Icons.menu,
          //         color:
          //             Colors.white, // Ajoutez la couleur que vous souhaitez ici
          //       ),
          //       tooltip: 'Menu',
          //     ),
          //   ),
          if (_isMenuOpen)
            Container(
              width: (screenSize.width / 5 < minFieldWidth)
                  ? minFieldWidth
                  : screenSize.width / 5,
              child: Drawer(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0.0),
                ),
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: [
                    // SizedBox(
                    //   height: 100,
                    //   child: DrawerHeader(
                    //       decoration: BoxDecoration(
                    //         color: Theme.of(context).colorScheme.inversePrimary,
                    //       ),
                    //       child: Row(
                    //         children: [
                    //           IconButton(
                    //             onPressed: () {
                    //               setState(() {
                    //                 _isMenuOpen = !_isMenuOpen;
                    //               });
                    //             },
                    //             icon: const Icon(Icons.menu),
                    //             tooltip: 'Menu',
                    //           ),
                    //           const Center(
                    //             child: Text(
                    //               'Menu',
                    //               style: TextStyle(
                    //                 color: Colors.white,
                    //                 fontSize: 24,
                    //               ),
                    //             ),
                    //           ),
                    //         ],
                    //       )),
                    // ),
                    Padding(
                      padding: EdgeInsets.only(left: 15, top: 10),
                      child: DefaultTextStyle.merge(
                        style: const TextStyle(
                          color: Colors.black87,
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                        ),
                        child: Text("Menu"),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: ListTile(
                        title: const Text('Liste des campagnes'),
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
                        title: const Text('Créer une nouvelle campagne'),
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
                        title: const Text('Créer une nouvelle fiche'),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const CreateForm()),
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
                                builder: (context) => const Map()),
                          );
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: ListTile(
                        title: DefaultTextStyle.merge(
                          style: const TextStyle(
                            color: Colors.red,
                          ),
                          child: Text("Déconnexion"),
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Authentification(
                                      title: 'Authentification',
                                    )),
                          );
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}
