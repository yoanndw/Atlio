import 'dart:collection';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_marker_cluster/flutter_map_marker_cluster.dart';

// import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import 'package:latlong2/latlong.dart';

import 'model/fiche.dart';

void main() {
  runApp(CampagneMap(fiches: [],));
}

class CampagneMap extends StatefulWidget {

  final List<Fiche> fiches;
  List<Marker> _markers = [];

  CampagneMap({super.key, required this.fiches});

  @override
  State<CampagneMap> createState() => _CampagneMapState();
}

class _CampagneMapState extends State<CampagneMap> /*with OSMMixinObserver*/ {

  final Map<Marker, Widget> fiches = HashMap();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // initMarkers();
    // _markers = _buildMarkers();
    initMarkers();
    _popupController = PopupController();
    //controller.addObserver(this);
  }

  void initMarkers() {
    for (var i = 0; i < widget.fiches.length; i++) {
      var currentFiche = widget.fiches[i];
      Marker marker = Marker(
          point: LatLng(currentFiche.positionGps["lat"]!, currentFiche.positionGps["lon"]!),
          width: 80,
          height: 80,
          child: Icon(Icons.star)
      );
      widget._markers.add(marker);

      if(currentFiche.photos.isEmpty) {
        fiches[marker] = const Icon(Icons.insert_photo_outlined);
      } else {
        fiches[marker] = currentFiche.photos[0] as Widget;
      }
    }
  }


  MapController controller = MapController();
  late final PopupController _popupController;

  List<Marker> _buildMarkers() {
    return [
      const Marker(
        point: LatLng(44.421, 10.404),
        width: 40,
        height: 40,
        child: Icon(
          Icons.ac_unit,
          size: 40,
        ),
      ),
      Marker(
        point: const LatLng(45.683, 10.839),
        width: 20,
        height: 40,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.black54,
            border: Border.all(color: Colors.black, width: 0.0),
            borderRadius: const BorderRadius.all(Radius.elliptical(20, 40)),
          ),
          width: 20,
          height: 40,
        ),
      ),
      Marker(
        point: const LatLng(45.246, 5.783),
        width: 40,
        height: 20,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.blue.withOpacity(0.5),
            border: Border.all(color: Colors.black, width: 0.0),
            borderRadius: const BorderRadius.all(Radius.elliptical(40, 20)),
          ),
          width: 40,
          height: 20,
        ),
      ),
    ];
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FlutterMap(
        options: MapOptions(
          initialZoom: 5.0,
          initialCenter: const LatLng(44.421, 10.404),
          onTap: (_, __) => _popupController.hideAllPopups(),
        ),
        children: [
          TileLayer(
            urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
          ),
          PopupMarkerLayer(
            options: PopupMarkerLayerOptions(
              markerCenterAnimation: const MarkerCenterAnimation(),
              markers: widget._markers,
              popupController: _popupController,
              popupDisplayOptions: PopupDisplayOptions(
                builder: (BuildContext context, Marker marker) =>
                    Container(
                      // decoration: BoxDecoration(
                      //   color: Colors.blue.withOpacity(0.5),
                      //   border: Border.all(color: Colors.red, width: 0.0),
                      //   borderRadius: const BorderRadius.all(Radius.elliptical(40, 20)),
                      // ),
                      child: fiches[marker],
                      width: 80,
                      height: 80,
                    ),
                animation: const PopupAnimation.fade(
                    duration: Duration(milliseconds: 700)),
              ),
              markerTapBehavior: MarkerTapBehavior.togglePopup(),
              onPopupEvent: (event, selectedMarkers) {
                ScaffoldMessenger.of(context).hideCurrentSnackBar();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(event.runtimeType.toString()),
                    duration: const Duration(seconds: 1),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

}
