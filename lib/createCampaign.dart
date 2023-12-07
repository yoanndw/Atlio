import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:project_ofb/campaignList.dart';
import 'package:project_ofb/model/campagne.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

void main() {
  runApp(const CreateCampaign());
}

class CreateCampaign extends StatefulWidget {
  const CreateCampaign({super.key});

  @override
  State<CreateCampaign> createState() => _CreateCampaignState();
}

class _CreateCampaignState extends State<CreateCampaign> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final titreController = TextEditingController();
  DateTime dateDebut = DateTime(2000, 1, 1);
  DateTime dateFin = DateTime(2000, 1, 1);
  final descriptionController = TextEditingController();
  final fichesController = TextEditingController();

  final double minFieldWidth = 300.0;
  bool _showDatePicker = false;

  static final List<String> _animals = [
    "Lion",
    "Flamingo",
    "Hippo",
    "Horse",
    "Tiger",
    "Penguin",
    "Spider",
    "Snake",
    "Bear",
    "Beaver",
    "Cat",
    "Fish",
    "Hugo Hamon",
    "Rabbit",
    "Mouse",
    "Dog",
    "Zebra",
    "Cow",
    "Frog",
    "Blue Jay",
    "Moose",
    "Gecko",
    "Kangaroo",
    "Shark",
    "Crocodile",
    "Owl",
    "Dragonfly",
    "Dolphin",
  ];

  static final List<String> _cities = [
    "Rennes",
    "Paris",
    "Lyon",
    "Nice",
    "Lille",
    "Montpellier",
    "Quimper",
    "Brest",
    "Saint-Brienc",
    "Pleumeleuc",
    "Hugo Hamon",
    "Dinan",
    "Dinard",
    "Saint-Malo",
    "Auray",
    "Cesson",
    "Nantes",
    "Bordeaux",
    "Verdin",
    "Le Rheu",
    "Bruz",
    "Vern",
    "Vitrée",
    "Tour",
    "Montcuq",
    "Marseille",
    "La Rochelle",
    "Carnac",
  ];

  List<String> _selectedAnimals = [];
  List<String> _selectedCities = [];

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the widget tree.
    // This also removes the _printLatestValue listener.
    titreController.dispose();
    descriptionController.dispose();
    fichesController.dispose();
    super.dispose();
  }

  void _onSelectionChanged(DateRangePickerSelectionChangedArgs args) {
    dateDebut = args.value.startDate;
    if (args.value.endDate != null) {
      dateFin = args.value.endDate;
    }
  }

  void _insertCampaign(Campagne c) {
    FirebaseFirestore.instance
        .collection('campaigns')
        .add(c.toFirestore())
        .then((value) => print('Inserted campaign $value.'))
        .catchError(
            (err) => print('ERROR: Could not insert campaign $c: $err'));
  }

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
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Création d'une nouvelle campagne"),
      ),
      body: Container(
        // Set the background image
        height: screenSize.height,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/background_image.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Align(
              alignment: Alignment.center,
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    Container(
                      width: (screenSize.width / 2 < minFieldWidth)
                          ? minFieldWidth
                          : screenSize.width / 2,
                      decoration: BoxDecoration(
                        color: Colors.white54,
                        // Couleur de fond
                        border: Border.all(color: Colors.white),
                        // Couleur du trait
                        borderRadius:
                        BorderRadius.circular(10.0), // Coins arrondis
                      ),
                      child: TextFormField(
                        decoration: myInputDecoration("Titre"),
                        controller: titreController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Veuillez remplir ce champ';
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(height: 16),
                    Container(
                      width: (screenSize.width / 2 < minFieldWidth)
                          ? minFieldWidth
                          : screenSize.width / 2,
                      decoration: BoxDecoration(
                        color: Colors.white54,
                        // Couleur de fond
                        border: Border.all(color: Colors.white),
                        // Couleur du trait
                        borderRadius:
                        BorderRadius.circular(10.0), // Coins arrondis
                      ),
                      child: TextField(
                        decoration: myInputDecoration("Description"),
                        controller: descriptionController,
                      ),
                    ),
                    const SizedBox(height: 16),
                    SizedBox(
                      width: (screenSize.width / 2 < minFieldWidth)
                          ? minFieldWidth
                          : screenSize.width / 2,
                      child: MultiSelectDialogField(
                        decoration: BoxDecoration(
                          color: Colors.white54,
                          // Couleur de fond
                          border: Border.all(color: Colors.white),
                          // Couleur du trait
                          borderRadius:
                          BorderRadius.circular(10.0), // Coins arrondis
                        ),
                        items: _cities
                            .map((e) => MultiSelectItem(e, e.toString()))
                            .toList(),
                        listType: MultiSelectListType.CHIP,
                        onConfirm: (values) {
                          _selectedCities = values;
                        },
                        searchable: true,
                        validator: (values) {
                          if (values == null || values.isEmpty) {
                            return 'Veuillez sélectionner au moins une ville.';
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(height: 16),
                    SizedBox(
                      width: (screenSize.width / 2 < minFieldWidth)
                          ? minFieldWidth
                          : screenSize.width / 2,
                      child: MultiSelectDialogField(
                        decoration: BoxDecoration(
                          color: Colors.white54,
                          // Couleur de fond
                          border: Border.all(color: Colors.white),
                          // Couleur du trait
                          borderRadius:
                          BorderRadius.circular(10.0), // Coins arrondis
                        ),
                        items: _animals
                            .map((e) => MultiSelectItem(e, e.toString()))
                            .toList(),
                        listType: MultiSelectListType.CHIP,
                        onConfirm: (values) {
                          _selectedAnimals = values;
                        },
                        searchable: true,
                        validator: (values) {
                          if (values == null || values.isEmpty) {
                            return 'Veuillez sélectionner au moins une espèce.';
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(height: 16),
                    if (_showDatePicker)
                      SizedBox(
                        height: (screenSize.width / 4 < minFieldWidth)
                            ? minFieldWidth
                            : screenSize.width / 4,
                        width: (screenSize.width / 4 < minFieldWidth)
                            ? minFieldWidth
                            : screenSize.width / 4,
                        child: SfDateRangePicker(
                          backgroundColor: Colors.white54,
                          onSelectionChanged: _onSelectionChanged,
                          selectionMode: DateRangePickerSelectionMode.range,
                        ),
                      )
                    else
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            _showDatePicker = true;
                          });
                        },
                        child: const Text('Afficher le calendrier'),
                      ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: Container(
        alignment: Alignment.bottomCenter,
        child: ElevatedButton(
          child: const Text('Lets go !'),
          onPressed: () {
            // Valider le formulaire avant de procéder
            if (_formKey.currentState!.validate()) {
              // Si le formulaire est valide, naviguer vers la prochaine page
              if (dateFin != DateTime(2000, 1, 1)) {
                // Si le formulaire est valide et une plage de dates a été sélectionnée,
                // naviguer vers la prochaine page

                _insertCampaign(Campagne(
                  utilisateur: '',
                  titre: titreController.text,
                  dateDebut: dateDebut,
                  dateFin: dateFin,
                  description: descriptionController.text,
                  territoire: _selectedCities,
                  groupesTaxonomiques: _selectedAnimals,
                ));

                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const CampaignList()),
                );
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Veuillez sélectionner une plage de dates.'),
                  ),
                );
              }
            }
          },
        ),
      ),
    );
  }
}
