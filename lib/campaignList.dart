import 'package:flutter/material.dart';
import 'package:project_ofb/formList.dart';

void main() {
  runApp(const CampaignList());
}

class CampaignList extends StatefulWidget{
  const CampaignList({super.key});

  @override
  State<CampaignList> createState() => _CampaignListState();

}

class _CampaignListState extends State<CampaignList>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Liste des campagnes"),
      ),
      body: Column(

      ),
      floatingActionButton: Container(
        alignment: Alignment.bottomCenter,
        child: ElevatedButton(
            child: const Text('Lets go !'),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const FormList()),
              );
            }
        ),
      ),
    );
  }
  
}

