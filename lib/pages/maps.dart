import "dart:async";
import "package:flutter/material.dart";
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
  Position? _currentPosition;
  String? _currentAddress;

  @override
  void initState() {
    super.initState();
    carregarMarcadores();
    _localizacaoAtual();
  }

  _localizacaoAtual() async {
    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
    print('Localização: ' + position.toString());
  }

  Set<Marker> _marcadores = {};
  carregarMarcadores() {
    Set<Marker> marcadoresLocal = {};
    Marker marcadoIfpi = Marker(
      markerId: MarkerId('IFPI'),
      position: LatLng(-5.088544046019581, -42.81123803149089),
    );
    Marker marcadoIfpiSul = Marker(
      markerId: MarkerId('IFPI'),
      position: LatLng(-5.101723, -42.813114),
    );
    marcadoresLocal.add(marcadoIfpi);
    marcadoresLocal.add(marcadoIfpiSul);
    setState(() {
      _marcadores = marcadoresLocal;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        myLocationEnabled: true,
        mapType: MapType.normal,
        initialCameraPosition: CameraPosition(
          target: LatLng(-5.088544046019581,
              -42.81123803149089), // Posição inicial do mapa
          zoom: 15,
        ),
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
        markers: _marcadores,
      ),
    );
  }
}
