import 'package:flutter/material.dart';

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
        title: Text("Création d'une nouvelle campagne"),
      ),
      body: Column(

      ),
    );
  }

}

