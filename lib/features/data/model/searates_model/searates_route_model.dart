import 'package:mytradeasia/features/domain/entities/searates_entities/searates_route_entity.dart';

class SearatesRouteModel extends SearatesRouteEntity {
  String? status;
  String? message;
  Data? data;

  SearatesRouteModel({this.status, this.message, this.data});

  SearatesRouteModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
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
      json['route'].forEach((v) {
        route!.add(new Route.fromJson(v));
      });
    }
    pin = json['pin'].cast<double>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.route != null) {
      data['route'] = this.route!.map((v) => v.toJson()).toList();
    }
    data['pin'] = this.pin;
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
      json['path'].forEach((v) {
        path!.add(v);
      });
    }
    type = json['type'];
    transportType = json['transport_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.path != null) {
      data['path'] = this.path!.map((v) => v).toList();
    }
    data['type'] = this.type;
    data['transport_type'] = this.transportType;
    return data;
  }
}
