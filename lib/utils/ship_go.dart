import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:mytradeasia/utils/theme.dart';

class ShipGoScreen extends StatelessWidget {
  const ShipGoScreen({super.key});

  final double latitude = 777.9;
  final double longitude = 777.9;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: greyColor,
        title: const Text(
          "Ships Go Tracking",
          style: TextStyle(color: blackColor),
        ),
      ),
      body: FlutterMap(
        nonRotatedChildren: [
          RichAttributionWidget(
            attributions: [
              TextSourceAttribution('OpenStreetMap contributors', onTap: () {}),
            ],
          ),
        ],
        options: MapOptions(
          center: LatLng(-3.333258, 71.586335),
          zoom: 2.0,
        ),
        children: [
          TileLayer(
            urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
            userAgentPackageName: 'com.example.app',
          ),
          PolylineLayer(
            polylines: [
              Polyline(
                points: [
                  LatLng( 32.083221,
            -81.099869),
                  LatLng(32.08354, -81.09983),
                ],
              )
            ],
          ),
          CircleLayer(
            circles: [
              CircleMarker(
                  point: LatLng(-3.333258, 71.586335),
                  color: Colors.red.withOpacity(0.2),
                  borderStrokeWidth: 2,
                  useRadiusInMeter: true,
                  radius: 100000 // 2000 meters | 2 km
                  ),
            ],
          ),
          MarkerLayer(
            markers: [
              Marker(
                // point: LatLng(-6.200000, 106.816666),
                point: LatLng(24.47979, 118.08186999999998),
                builder: (context) {
                  return const Icon(
                    Icons.location_on,
                    color: Colors.red,
                    size: 40.0,
                  );
                },
              ),
              Marker(
                // point: LatLng(18.9466, 72.9416),
                point: LatLng(32.08354, -81.09983),
                builder: (context) {
                  return const Icon(Icons.location_on, color: Colors.red);
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}
