import "dart:async";
import "package:app_contacts/controller/map_controller.dart";
import "package:flutter/material.dart";
import "package:flutter_modular/flutter_modular.dart";
import "package:google_maps_flutter/google_maps_flutter.dart";
import "package:geolocator/geolocator.dart";

class Maps extends StatefulWidget {
  const Maps({super.key});

  @override
  State<Maps> createState() => _Maps();
}

class _Maps extends State<Maps> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();
  final _controllerMap = Modular.get<MapsController>();

  @override
  void initState() {
    loadingMarkers();
    super.initState();
  }

  loadingMarkers() async {
    await _controllerMap.listenAllMarkers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        ValueListenableBuilder(
            valueListenable: _controllerMap.markers,
            builder: (context, value, child) {
              return GoogleMap(
                myLocationEnabled: true,
                mapType: MapType.normal,
                initialCameraPosition: const CameraPosition(
                  target: LatLng(-5.088544046019581,
                      -42.81123803149089), // Posição inicial do mapa
                  zoom: 15,
                ),
                onMapCreated: (controller) {
                  _controllerMap.mapController = controller;
                },
                markers: _controllerMap.markers.value,
              );
            }),
      ]),
    );
  }
}
