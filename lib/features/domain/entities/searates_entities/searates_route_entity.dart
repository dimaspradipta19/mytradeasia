import 'package:equatable/equatable.dart';

import '../../../data/model/searates_model/searates_route_model.dart';

class SearatesRouteEntity extends Equatable {
  String? status;
  String? message;
  Data? data;

  SearatesRouteEntity({this.status, this.message, this.data});

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

// class Data {
//   List<Route>? route;
//   List<double>? pin;
//
//   Data({this.route, this.pin});
// }
//
// class Route {
//   List<List<double>>? path;
//   String? type;
//   String? transportType;
//
//   Route({this.path, this.type, this.transportType});
// }
