import 'package:flutter/material.dart';
import 'package:project_ofb/profile.dart';
import 'package:project_ofb/widgets/menu.dart';

import 'model/fiche.dart';

class ShowForm extends StatefulWidget {
  final Fiche fiche;

  const ShowForm({super.key, required Fiche this.fiche});

  @override
  State<ShowForm> createState() => _ShowFormState();
}

class _ShowFormState extends State<ShowForm> {
  bool _isMenuOpen = false;

  @override
  Widget build(BuildContext context) {
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
          title: Text(widget.fiche.campagneName),
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
        body: SingleChildScrollView(
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      height: 200,
                      width: double.infinity,
                      child: Image.asset(widget.fiche.photos.elementAt(0))),
                  Padding(
                      padding: EdgeInsets.only(left: 15, right: 15, top: 10),
                      child: Row(
                        children: [
                          Icon(Icons.room_outlined),
                          Text(widget.fiche.lieu)
                        ],
                      )),
                  Padding(
                      padding: EdgeInsets.only(left: 15, right: 15, top: 10),
                      child: Row(
                        children: [
                          Icon(Icons.access_time_outlined),
                          Text(" " +
                              widget.fiche.dateHeure.day.toString() +
                              "/" +
                              widget.fiche.dateHeure.month.toString() +
                              "/" +
                              widget.fiche.dateHeure.year.toString() +
                              " - " +
                              widget.fiche.dateHeure.hour.toString() +
                              ":" +
                              widget.fiche.dateHeure.minute.toString())
                        ],
                      )),
                  Padding(
                      padding: EdgeInsets.only(left: 15, right: 15, top: 10),
                      child: Row(
                        children: [
                          Icon(Icons.person_outline),
                          Text(widget.fiche.user)
                        ],
                      )),
                  Padding(
                    padding: EdgeInsets.only(left: 15, right: 15, top: 10),
                    child: Flexible(
                        child: Text(widget.fiche.observation,
                            textAlign: TextAlign.justify)),
                  ),
                ],
              ),
              Menu(isMenuOpen: _isMenuOpen),
            ],
          ),
        ));
  }
}