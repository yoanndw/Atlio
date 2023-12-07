import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_marker_cluster/flutter_map_marker_cluster.dart';

import 'package:latlong2/latlong.dart';
import 'package:project_ofb/widgets/markerPreview.dart';

import 'model/fiche.dart';

void main() {
  runApp(CampagneMap(
    fiches: [],
  ));
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
          point: LatLng(currentFiche.positionGps["lat"]!,
              currentFiche.positionGps["lon"]!),
          width: 80,
          height: 80,
          child: Icon(Icons.star));
      widget._markers.add(marker);

      fiches[marker] = MarkerPreview(fiche: currentFiche);
    }
  }

  MapController controller = MapController();
  late final PopupController _popupController;

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
                builder: (BuildContext context, Marker marker) => SizedBox(
                  width: 90,
                  height: 200,
                  child: fiches[marker],
                ),
                snap: PopupSnap.markerCenter,
                animation: const PopupAnimation.fade(
                    duration: Duration(milliseconds: 300)),
              ),
              markerTapBehavior: MarkerTapBehavior.togglePopup(),
              onPopupEvent: (event, selectedMarkers) {},
            ),
          ),
        ],
      ),
    );
  }
}
