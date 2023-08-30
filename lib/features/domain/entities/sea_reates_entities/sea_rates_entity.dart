import 'package:equatable/equatable.dart';

class SearatesEntity extends Equatable {
  final String? status;
  final String? message;
  final Data? data;

  SearatesEntity({
    required this.status,
    required this.message,
    required this.data,
  });

  @override
  List<Object?> get props => throw UnimplementedError();
}

class Data {
  final Metadata? metadata;
  final List<Location>? locations;
  final List<Facility>? facilities;
  final Route? route;
  final List<dynamic>? vessels;
  final List<Container>? containers;

  Data({
    required this.metadata,
    required this.locations,
    required this.facilities,
    required this.route,
    required this.vessels,
    required this.containers,
  });
}

class Container {
  final String? number;
  final String? isoCode;
  final String? sizeType;
  final String? status;
  final List<Event>? events;

  Container({
    required this.number,
    required this.isoCode,
    required this.sizeType,
    required this.status,
    required this.events,
  });
}

class Event {
  final int? orderId;
  final int? location;
  final int? facility;
  final String? description;
  final String? eventType;
  final String? eventCode;
  final String? status;
  final DateTime? date;
  final bool? actual;
  final bool? isAdditionalEvent;
  final String? type;
  final dynamic transportType;
  final dynamic vessel;
  final dynamic voyage;

  Event({
    required this.orderId,
    required this.location,
    required this.facility,
    required this.description,
    required this.eventType,
    required this.eventCode,
    required this.status,
    required this.date,
    required this.actual,
    required this.isAdditionalEvent,
    required this.type,
    required this.transportType,
    required this.vessel,
    required this.voyage,
  });
}

class Facility {
  final int? id;
  final String? name;
  final String? countryCode;
  final String? locode;
  final String? bicCode;
  final dynamic smdgCode;
  final dynamic lat;
  final dynamic lng;

  Facility({
    required this.id,
    required this.name,
    required this.countryCode,
    required this.locode,
    required this.bicCode,
    required this.smdgCode,
    required this.lat,
    required this.lng,
  });
}

class Location {
  final int? id;
  final String? name;
  final String? state;
  final String? country;
  final String? countryCode;
  final String? locode;
  final double? lat;
  final double? lng;
  final String? timezone;

  Location({
    required this.id,
    required this.name,
    required this.state,
    required this.country,
    required this.countryCode,
    required this.locode,
    required this.lat,
    required this.lng,
    required this.timezone,
  });
}

class Metadata {
  final String? type;
  final String? number;
  final String? sealine;
  final String? sealineName;
  final String? status;
  final DateTime? updatedAt;
  final ApiCalls? apiCalls;
  final ApiCalls? uniqueShipments;

  Metadata({
    required this.type,
    required this.number,
    required this.sealine,
    required this.sealineName,
    required this.status,
    required this.updatedAt,
    required this.apiCalls,
    required this.uniqueShipments,
  });
}

class ApiCalls {
  final int? total;
  final int? used;
  final int? remaining;

  ApiCalls({
    required this.total,
    required this.used,
    required this.remaining,
  });
}

class Route {
  final Pod? prepol;
  final Pod? pol;
  final Pod? pod;
  final Pod? postpod;

  Route({
    required this.prepol,
    required this.pol,
    required this.pod,
    required this.postpod,
  });
}

class Pod {
  final dynamic location;
  final DateTime? date;
  final bool? actual;
  final dynamic predictiveEta;

  Pod({
    required this.location,
    required this.date,
    required this.actual,
    required this.predictiveEta,
  });
}
