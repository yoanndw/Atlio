import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';

void main() {
  runApp(const Map());
}

class Map extends StatefulWidget{
  const Map({super.key});

  @override
  State<Map> createState() => _MapState();

}

class _MapState extends State<Map>{


  // default constructor
  MapController controller = MapController(
    initPosition: GeoPoint(latitude: 48.083328, longitude: -1.68333),
    areaLimit: BoundingBox(
      east: 10.4922941,
      north: 47.8084648,
      south: 45.817995,
      west:  5.9559113,
    ),

  );


  @override
  Widget build(BuildContext context) {
    controller.addMarker(GeoPoint(latitude: 48.083328, longitude: -1.68333),
        markerIcon:const MarkerIcon(
          icon: Icon(
            Icons.location_history_rounded,
            color: Colors.red,
            size: 48,
          )),
        angle:pi/3,
      iconAnchor: IconAnchor(anchor: Anchor.top,)
    );

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text("Map View"),
        ),
        body: OSMFlutter(
            controller: controller,
            osmOption: OSMOption(
              userTrackingOption: const UserTrackingOption(
                enableTracking: true,
                unFollowUser: false,
              ),
              staticPoints: [

                StaticPositionGeoPoint("idididid", const MarkerIcon(
                  icon: Icon(
                    Icons.add_a_photo,
                    color: Colors.red,
                    size: 48,
                  )
                ),
                    [
                      GeoPoint(latitude: 48.083328, longitude: -1.68333),
                      GeoPoint(latitude: 47.083328, longitude: -1.68333),
                      GeoPoint(latitude: 46.083328, longitude: -1.68333),
                      GeoPoint(latitude: 45.083328, longitude: -1.68333),
                    ]
                )
              ],
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
    );
  }

}

