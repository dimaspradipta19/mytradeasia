import 'package:equatable/equatable.dart';
import 'package:mytradeasia/features/data/model/searates_model/searates_route_model.dart';

class SearatesRouteEntity extends Equatable {
  String? status;
  String? message;
  Data? data;

  SearatesRouteEntity({this.status, this.message, this.data});

  @override
  List<Object?> get props {
    return [status, message, data];
  }
}
