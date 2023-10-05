import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:mytradeasia/features/presentation/state_management/searates_bloc/searates_route/searates_route_bloc.dart';
import 'package:mytradeasia/features/presentation/state_management/searates_bloc/searates_route/searates_route_event.dart';
import 'package:mytradeasia/features/presentation/state_management/searates_bloc/searates_route/searates_route_state.dart';

import '../../../../../../config/themes/theme.dart';

class TrackingShipmentMapScreen extends StatefulWidget {
  const TrackingShipmentMapScreen({Key? key}) : super(key: key);

  @override
  State<TrackingShipmentMapScreen> createState() =>
      _TrackingShipmentMapScreenState();
}

class _TrackingShipmentMapScreenState extends State<TrackingShipmentMapScreen> {
  LatLng listDoubleToLatLng(List<double> list) {
    return LatLng(list.first, list.last);
  }

  List<LatLng> toListLatLng(List<List<double>> list) {
    List<LatLng> newList = [];
    for (var element in list) {
      newList.add(LatLng(element.first, element.last));
    }
    return newList;
  }

  @override
  void initState() {
    BlocProvider.of<SearatesRouteBloc>(context)
        .add(GetRoute("COAU7885072330", "BL", "COSU"));
    super.initState();
  }

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
                  center: listDoubleToLatLng(state.route!.data!.pin!), zoom: 3),
              children: [
                TileLayer(
                  urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                  userAgentPackageName: 'com.example.app',
                ),
                PolylineLayer(
                  polylines: [
                    Polyline(
                        points:
                            toListLatLng(state.route!.data!.route![0].path!),
                        color: Colors.blue,
                        strokeWidth: 3,
                        isDotted: true),
                  ],
                ),
                PolylineLayer(
                  polylines: [
                    Polyline(
                        points:
                            toListLatLng(state.route!.data!.route![1].path!),
                        color: Colors.blue,
                        strokeWidth: 3,
                        isDotted: true),
                  ],
                ),
                MarkerLayer(
                  markers: [
                    Marker(
                      point: toListLatLng(state.route!.data!.route![0].path!)
                          .first,
                      builder: (context) {
                        return const Icon(Icons.location_on, color: Colors.red);
                      },
                    ),
                    Marker(
                      // point: LatLng(-6.1333333333333, 106.83333333333),
                      point: listDoubleToLatLng(state.route!.data!.pin!),
                      builder: (context) {
                        return const Icon(Icons.directions_boat,
                            color: Colors.deepOrangeAccent);
                      },
                    ),
                    Marker(
                      point:
                          toListLatLng(state.route!.data!.route![0].path!).last,
                      builder: (context) {
                        return const Icon(Icons.location_on,
                            color: Colors.blue);
                      },
                    ),
                    Marker(
                      point:
                          toListLatLng(state.route!.data!.route![1].path!).last,
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
