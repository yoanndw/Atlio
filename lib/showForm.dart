import 'package:flutter/material.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart' as osm;
import 'package:project_ofb/widgets/menu.dart';

import 'model/fiche.dart';

class ShowForm extends StatefulWidget {
  final Fiche fiche;

  const ShowForm({super.key, required Fiche this.fiche});

  @override
  State<ShowForm> createState() => _ShowFormState();
}

class _ShowFormState extends State<ShowForm> with osm.OSMMixinObserver{
  bool _isMenuOpen = false;
  String? _campaignName;

  final double minFieldWidth = 300.0;

  osm.MapController controller = osm.MapController(
    initPosition: osm.GeoPoint(latitude: 47.083328, longitude: -1.68333),
  );

  @override
  void initState() {
    super.initState();
    controller.addObserver(this);
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(_campaignName ?? ''),
        ),
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                      height: 200,
                      width: double.infinity,
                      child: Image.network(widget.fiche.photos.elementAt(0))),
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
                          Text(widget.fiche.utilisateur)
                        ],
                      )),
                  Padding(
                    padding: EdgeInsets.only(left: 15, right: 15, top: 10),
                    //   child: Flexible(
                    //       child: Text(widget.fiche.observation,
                    //           textAlign: TextAlign.justify)),
                  ),
                  Container(
                      decoration: BoxDecoration(
                        color: Colors.white70,
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.circular(0.0),
                      ),
                      height: (screenSize.width / 2 < minFieldWidth)
                          ? minFieldWidth
                          : screenSize.width / 2,
                      width: (screenSize.width / 2 < minFieldWidth)
                          ? minFieldWidth
                          : screenSize.width / 2,
                      child: osm.OSMFlutter(
                        controller: controller,
                        osmOption: osm.OSMOption(
                          userTrackingOption: const osm.UserTrackingOption(
                            enableTracking: true,
                            unFollowUser: false,
                          ),
                          zoomOption: const osm.ZoomOption(
                            initZoom: 8,
                            minZoomLevel: 3,
                            maxZoomLevel: 19,
                            stepZoom: 1.0,
                          ),
                          userLocationMarker: osm.UserLocationMaker(
                            personMarker: const osm.MarkerIcon(
                              icon: Icon(
                                Icons.location_history_rounded,
                                color: Colors.red,
                                size: 48,
                              ),
                            ),
                            directionArrowMarker: const osm.MarkerIcon(
                              icon: Icon(
                                Icons.double_arrow,
                                size: 48,
                              ),
                            ),
                          ),
                          roadConfiguration: const osm.RoadOption(
                            roadColor: Colors.yellowAccent,
                          ),
                        ),
                      )),
                ],
              ),
            ),
            Menu(isMenuOpen: _isMenuOpen),
          ],
        ));
  }

  @override
  Future<void> mapIsReady(bool isReady) {
    controller.goToLocation(osm.GeoPoint(latitude: widget.fiche.positionGps["lat"]!, longitude: widget.fiche.positionGps["lon"]!));
    // controller.addMarker(osm.GeoPoint(latitude: widget.fiche.positionGps["lat"]!, longitude: widget.fiche.positionGps["lon"]!));
    return Future(() => null);
  }
}
