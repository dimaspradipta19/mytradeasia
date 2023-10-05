import 'package:latlong2/latlong.dart';
import 'package:mytradeasia/features/domain/entities/searates_entities/searates_route_entity.dart';

class SearatesRouteModel extends SearatesRouteEntity {
  String? status;
  String? message;
  Data? data;

  SearatesRouteModel({this.status, this.message, this.data});

  SearatesRouteModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  List<Route>? route;
  List<double>? pin;

  Data({this.route, this.pin});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['route'] != null) {
      route = <Route>[];
      for (var item in json['route']) {
        route!.add(Route.fromJson(item));
      }
    }
    pin = json['pin'].cast<double>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (route != null) {
      data['route'] = route!.map((v) => v.toJson()).toList();
    }
    data['pin'] = pin;
    return data;
  }
}

class Route {
  List<List<double>>? path;
  String? type;
  String? transportType;

  Route({this.path, this.type, this.transportType});

  Route.fromJson(Map<String, dynamic> json) {
    if (json['path'] != null) {
      path = <List<double>>[];
      for (var item in json['path']) {
        path!.add(List<double>.from(item.map((x) => x.toDouble())));
      }
    }
    type = json['type'];
    transportType = json['transport_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (path != null) {
      data['path'] =
          path!.map((v) => List<dynamic>.from(v.map((x) => x))).toList();
    }
    data['type'] = type;
    data['transport_type'] = transportType;
    return data;
  }
}
