import 'package:flutter/material.dart';

import 'authentification.dart';
import '../campaignList.dart';
import '../createCampaign.dart';
import '../createForm.dart';

class Menu extends StatelessWidget {
  final double minFieldWidth = 300.0;
  final bool isMenuOpen;

  // Constructor
  const Menu({Key? key, required bool this.isMenuOpen}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Stack(children: [
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
      if (this.isMenuOpen)
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
                // Padding(
                //   padding: EdgeInsets.only(left: 10),
                //   child: ListTile(
                //     title: const Text('MAP'),
                //     onTap: () {
                //       Navigator.push(
                //         context,
                //         MaterialPageRoute(
                //             builder: (context) => const Map()),
                //       );
                //     },
                //   ),
                // ),
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
                            builder: (context) => const Authentification()),
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        )
    ]);
  }
}
