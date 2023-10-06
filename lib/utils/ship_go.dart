import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:mytradeasia/features/presentation/state_management/searates_bloc/searates_route/searates_route_bloc.dart';
import 'package:mytradeasia/features/presentation/state_management/searates_bloc/searates_route/searates_route_state.dart';
import '../config/themes/theme.dart';

class ShipGoScreen extends StatelessWidget {
  ShipGoScreen({super.key});

  final double latitude = 777.9;
  final double longitude = 777.9;

  final otherSeaRoutes = [
    [1.28967, 103.85007000000002],
    [1.2695, 103.51166699999999],
    [2.846667, 101.29124999999999],
    [8.203333, 98.28544399999998],
    [15.952861, 94.2425],
    [22.270392840044316, 91.69888937322179],
    [22.3384, 91.83168]
  ];

  final seaRoutes = [
    [-6.1333333333333, 106.83333333333002],
    [-6.1333333333333, 106.83333333333],
    [-6.114287008431011, 106.83641028243761],
    [-6.025404158886997, 106.85076937827307],
    [-6.006357833984708, 106.85384632738067],
    [-5.986595808887002, 106.73151932827358],
    [-5.894373025097706, 106.16065999910711],
    [-5.874611, 106.03833299999997],
    [-5.47729025, 106.04564145],
    [-3.62312675, 106.07974754999998],
    [-3.225806, 106.08705600000002],
    [-3.10075175, 106.01686845],
    [-2.5171652499999997, 105.68932655000003],
    [-2.392111, 105.61913900000002],
    [-2.3463651999999997, 105.54563480000002],
    [-2.1328848, 105.20261519999997],
    [-2.087139, 105.12911099999997],
    [-1.84457655, 105.04930274999998],
    [-0.7126184499999999, 104.67686425],
    [-0.470056, 104.59705600000001],
    [-0.43498929999999997, 104.5719934],
    [-0.2713447, 104.45503459999998],
    [-0.236278, 104.42997200000002],
    [-0.007385799999999998, 104.34298669999998],
    [1.0607778, 103.9370553],
    [1.28967, 103.85007000000002]
  ];

  @override
  Widget build(BuildContext context) {
    List<LatLng> latlng = [];
    seaRoutes.forEach((element) {
      latlng.add(LatLng(element[0], element[1]));
    });

    List<LatLng> otherLatLng = [];
    otherSeaRoutes.forEach((element) {
      otherLatLng.add(LatLng(element[0], element[1]));
    });

    return Scaffold(
      appBar: AppBar(
        backgroundColor: greyColor,
        title: const Text(
          "Ships Go Tracking",
          style: TextStyle(color: blackColor),
        ),
      ),
      body: BlocBuilder<SearatesRouteBloc, SearatesRouteState>(
        builder: (context, state) {
          log("ROUTE STATE : ${state}");
          if (state is SearatesRouteLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is SearatesRouteDone) {
            return FlutterMap(
              nonRotatedChildren: [
                RichAttributionWidget(
                  attributions: [
                    TextSourceAttribution('OpenStreetMap contributors',
                        onTap: () {}),
                  ],
                ),
              ],
              options: MapOptions(
                  center: latlng.elementAt(latlng.length ~/ 2), zoom: 1.5),
              children: [
                TileLayer(
                  urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                  userAgentPackageName: 'com.example.app',
                ),
                PolylineLayer(
                  polylines: [
                    Polyline(
                        points: latlng,
                        color: Colors.blue,
                        strokeWidth: 3,
                        isDotted: true),
                  ],
                ),
                PolylineLayer(
                  polylines: [
                    Polyline(
                        points: otherLatLng,
                        color: Colors.blue,
                        strokeWidth: 3,
                        isDotted: true),
                  ],
                ),
                MarkerLayer(
                  markers: [
                    Marker(
                      point: latlng.first,
                      builder: (context) {
                        return const Icon(Icons.location_on, color: Colors.red);
                      },
                    ),
                    Marker(
                      // point: LatLng(-6.1333333333333, 106.83333333333),
                      point: latlng.elementAt(latlng.length ~/ 2),
                      builder: (context) {
                        return const Icon(Icons.directions_boat,
                            color: Colors.deepOrangeAccent);
                      },
                    ),
                    Marker(
                      point: latlng.last,
                      builder: (context) {
                        return const Icon(Icons.location_on,
                            color: Colors.blue);
                      },
                    ),
                    Marker(
                      point: otherLatLng.last,
                      builder: (context) {
                        return const Icon(Icons.location_on,
                            color: Colors.green);
                      },
                    ),
                  ],
                )
              ],
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
