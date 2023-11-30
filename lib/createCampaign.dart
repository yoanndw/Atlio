import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:project_ofb/campaignList.dart';

void main() {
  runApp(const CreateCampaign());
}

class CreateCampaign extends StatefulWidget{
  const CreateCampaign({super.key});

  @override
  State<CreateCampaign> createState() => _CreateCampaignState();

}

class _CreateCampaignState extends State<CreateCampaign>{

  final titreController = TextEditingController();
  DateTime dateDebut = DateTime.now();
  DateTime dateFin = DateTime.now();
  final descriptionController = TextEditingController();
  final territoireController = TextEditingController();
  final groupesTaxonomiquesController = TextEditingController();
  final fichesController = TextEditingController();


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
    if(args.value.endDate != null){
      dateFin = args.value.endDate;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Création d'une nouvelle campagne"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              decoration: const InputDecoration(
                  hintText: "Titre"
              ),
              controller: titreController,
            ),
            TextField(
              decoration: const InputDecoration(
                  hintText: "Description"
              ),
              controller: descriptionController,
            ),
            TextField(
              decoration: const InputDecoration(
                  hintText: "Territoire"
              ),
              controller: territoireController,
            ),
            TextField(
              decoration: const InputDecoration(
                  hintText: "Groupes Taxonomiques"
              ),
              controller: groupesTaxonomiquesController,
            ),
            Container(
              // Adjust the height and width of the container to control the size of the date picker
              height: 200, // Adjust the height as needed
              width: 300, // Adjust the width as needed
              child:
                SfDateRangePicker(
                  onSelectionChanged: _onSelectionChanged,
                  selectionMode: DateRangePickerSelectionMode.range,
                ),
              ),

          ],
        ),
      ),
      floatingActionButton: Container(
        alignment: Alignment.bottomCenter,
        child: ElevatedButton(
          child: const Text('Lets go !'),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const CampaignList()),
              );
            }
        ),
      ),
    );
  }

}

