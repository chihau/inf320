import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  MainApp({super.key});

  CameraPosition universityPosition = CameraPosition(
    target: LatLng(-33.0366, -71.5952),
    zoom: 17,
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(title: Text('Hola Mapas')),
          body: GoogleMap(
            initialCameraPosition: universityPosition,
            mapType: MapType.hybrid,
            markers: {
              Marker(
                markerId: MarkerId('Entrada UTFSM'),
                position: LatLng(-33.0366, -71.5952),
                infoWindow: InfoWindow(
                  title: "UTFSM",
                  snippet: "Entrada a la universidad",
                ),
              ),
            },
            myLocationEnabled: true,
            myLocationButtonEnabled: true,
          )),
    );
  }
}
