import 'package:flutter/material.dart';
import 'package:project_ofb/createForm.dart';

void main() {
  runApp(const CreateCampaign());
}

class CreateCampaign extends StatefulWidget{
  const CreateCampaign({super.key});

  @override
  State<CreateCampaign> createState() => _CreateCampaignState();

}

class _CreateCampaignState extends State<CreateCampaign>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Création d'une nouvelle campagne"),
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
                MaterialPageRoute(builder: (context) => const CreateForm()),
              );
            }
        ),
      ),
    );
  }

}

