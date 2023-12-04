import 'package:flutter/material.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
//import 'package:camera/camera.dart';
import 'package:geocoding/geocoding.dart';

class CreateForm extends StatefulWidget {
  const CreateForm({super.key});

  @override
  State<CreateForm> createState() => _CreateFormState();
}

class _CreateFormState extends State<CreateForm> with OSMMixinObserver{
  final _formKey = GlobalKey<FormState>();

  double? _lat, _lon;
  String? _lieu;
  final DateTime _dateHeure = DateTime.timestamp();
  //List<XFile> _photos = [];
  String? _observation;
  int? _campagne, _utilisateur;

  final utilisateurs = [1, 2, 3];
  final campagne = 1;

  MapController controller = MapController(
    initPosition: GeoPoint(latitude: 48.083328, longitude: -1.68333),
    areaLimit: BoundingBox(
      east: 10.4922941,
      north: 47.8084648,
      south: 45.817995,
      west: 5.9559113,
    ),
  );


  @override
  void initState() {
    controller.addObserver(this);
    super.initState();
  }

  void _updateLocation() async {
    final lieux = await placemarkFromCoordinates(_lat!, _lon!);
    setState(() {
      _lieu = lieux[0].toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text("Création d'une nouvelle fiche."),
        ),
        body:
        Column(
          children: [
            Form(
                key: _formKey,
                child: Column(children: [
                  Text('Lieu: $_lieu'),
                  TextFormField(
                      decoration: const InputDecoration(hintText: 'Observations'),
                      onChanged: (v) {
                        setState(() {
                          _observation = v;
                        });
                      }),
                  DropdownMenu<int>(
                    dropdownMenuEntries: utilisateurs
                        .map((e) => DropdownMenuEntry(value: e, label: e.toString()))
                        .toList(),
                    controller: TextEditingController(),
                    onSelected: (v) {
                      setState(() {
                        _utilisateur = v;
                      });
                    },
                  ),
                  ElevatedButton(onPressed: _updateLocation, child: Text('Mettre à jour lieu')),
                  Container(
                      height: 300,
                      child : OSMFlutter(
                          controller: controller,
                          osmOption: OSMOption(
                            userTrackingOption: const UserTrackingOption(
                              enableTracking: true,
                              unFollowUser: false,
                            ),
                            zoomOption: const ZoomOption(
                              initZoom: 8,
                              minZoomLevel: 3,
                              maxZoomLevel: 19,
                              stepZoom: 1.0,
                            ),
                            userLocationMarker: UserLocationMaker(
                              personMarker: const MarkerIcon(
                                icon: Icon(
                                  Icons.location_history_rounded,
                                  color: Colors.red,
                                  size: 48,
                                ),
                              ),
                              directionArrowMarker: const MarkerIcon(
                                icon: Icon(
                                  Icons.double_arrow,
                                  size: 48,
                                ),
                              ),
                            ),
                            roadConfiguration: const RoadOption(
                              roadColor: Colors.yellowAccent,
                            ),
                            markerOption: MarkerOption(
                                defaultMarker: const MarkerIcon(
                                  icon: Icon(
                                    Icons.person_pin_circle,
                                    color: Colors.blue,
                                    size: 56,
                                  ),
                                )
                            ),
                          )
                      )
                  ),
                ]
                )
            ),
          ]
          ,)
    );
  }

  @override
  Future<void> mapIsReady(bool isReady) {
    throw UnimplementedError();
  }

  @override
  void onSingleTap(GeoPoint position) {
    super.onSingleTap(position);
    if(_lat != null) {
      controller.removeMarker(GeoPoint(latitude: _lat!, longitude: _lon!));
    }
    _lat = position.latitude;
    _lon = position.longitude;
    controller.addMarker(GeoPoint(latitude: position.latitude, longitude: position.longitude));

    print('update lat $_lat');
    print('update lon $_lon');

  }

}
