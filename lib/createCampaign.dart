import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:project_ofb/campaignList.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';

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
  final territoireController = TextEditingController();
  final groupesTaxonomiquesController = TextEditingController();
  final fichesController = TextEditingController();

  final double minFieldWidth = 300.0;

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

  final _items = _animals
      .map((animal) => MultiSelectItem<String>(animal, animal.toString()))
      .toList();

  List<String?> _selectedAnimals = [];

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the widget tree.
    // This also removes the _printLatestValue listener.
    titreController.dispose();
    descriptionController.dispose();
    territoireController.dispose();
    groupesTaxonomiquesController.dispose();
    fichesController.dispose();
    super.dispose();
  }

  void _onSelectionChanged(DateRangePickerSelectionChangedArgs args) {
    dateDebut = args.value.startDate;
    if (args.value.endDate != null) {
      dateFin = args.value.endDate;
    }
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Création d'une nouvelle campagne"),
      ),
      body: SingleChildScrollView(
        child: Container(
          // Set the background image
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/background_image.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Align(
              alignment: Alignment.center,
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    SizedBox(
                      width: (screenSize.width / 2 < minFieldWidth)
                          ? minFieldWidth
                          : screenSize.width / 2,
                      child: TextFormField(
                        decoration: const InputDecoration(
                          hintText: "Titre",
                        ),
                        controller: titreController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Veuillez remplir ce champ';
                          }
                          return null;
                        },
                      ),
                    ),
                    SizedBox(
                      width: (screenSize.width / 2 < minFieldWidth)
                          ? minFieldWidth
                          : screenSize.width / 2,
                      child: TextField(
                        decoration: const InputDecoration(
                          hintText: "Description",
                        ),
                        controller: descriptionController,
                      ),
                    ),
                    SizedBox(
                      width: (screenSize.width / 2 < minFieldWidth)
                          ? minFieldWidth
                          : screenSize.width / 2,
                      child: TextFormField(
                        decoration: const InputDecoration(
                          hintText: "Territoire",
                        ),
                        controller: territoireController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Veuillez remplir ce champ';
                          }
                          return null;
                        },
                      ),
                    ),
                    SizedBox(
                      width: (screenSize.width / 2 < minFieldWidth)
                          ? minFieldWidth
                          : screenSize.width / 2,
                      child: MultiSelectDialogField(
                        items: _animals
                            .map((e) => MultiSelectItem(e, e.toString()))
                            .toList(),
                        listType: MultiSelectListType.CHIP,
                        onConfirm: (values) {
                          _selectedAnimals = values;
                        },
                      ),
                    ),
                    Container(
                      height: (screenSize.width / 4 < minFieldWidth)
                          ? minFieldWidth
                          : screenSize.width / 4,
                      width: (screenSize.width / 4 < minFieldWidth)
                          ? minFieldWidth
                          : screenSize.width / 4,
                      child: SfDateRangePicker(
                        onSelectionChanged: _onSelectionChanged,
                        selectionMode: DateRangePickerSelectionMode.range,
                      ),
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
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const CampaignList()),
                );
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
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
