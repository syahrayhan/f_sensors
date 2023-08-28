import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class MapPage extends StatelessWidget {
  final double lat, lot;
  const MapPage({super.key, required this.lat, required this.lot});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Location"),
      ),
      body: FlutterMap(
        options: MapOptions(
          center: LatLng(lat, lot),
          zoom: 15,
          maxZoom: 17,
          minZoom: 14,
        ),
        nonRotatedChildren: [
          RichAttributionWidget(
            attributions: [
              TextSourceAttribution(
                'OpenStreetMap contributors',
                onTap: () {},
              ),
            ],
          ),
        ],
        children: [
          TileLayer(
            urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
            userAgentPackageName: 'com.example.flutter_sensor',
          ),
          MarkerLayer(
            markers: [
              Marker(
                point: LatLng(lat, lot),
                width: 80,
                height: 80,
                builder: (context) => const Icon(
                  Icons.location_on,
                  color: Colors.red,
                  size: 32,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
