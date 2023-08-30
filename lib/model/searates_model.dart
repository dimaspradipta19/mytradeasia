import 'dart:convert';

SearatesModel searatesModelFromJson(String str) =>
    SearatesModel.fromJson(json.decode(str));

String searatesModelToJson(SearatesModel data) => json.encode(data.toJson());

class SearatesModel {
  final String status;
  final String message;
  final Data data;

  SearatesModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory SearatesModel.fromJson(Map<String, dynamic> json) => SearatesModel(
        status: json["status"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data.toJson(),
      };
}

class Data {
  final Metadata metadata;
  final List<Location> locations;
  final List<Facility> facilities;
  final Route route;
  final List<dynamic> vessels;
  final List<Container> containers;

  Data({
    required this.metadata,
    required this.locations,
    required this.facilities,
    required this.route,
    required this.vessels,
    required this.containers,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        metadata: Metadata.fromJson(json["metadata"]),
        locations: List<Location>.from(
            json["locations"].map((x) => Location.fromJson(x))),
        facilities: List<Facility>.from(
            json["facilities"].map((x) => Facility.fromJson(x))),
        route: Route.fromJson(json["route"]),
        vessels: List<dynamic>.from(json["vessels"].map((x) => x)),
        containers: List<Container>.from(
            json["containers"].map((x) => Container.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "metadata": metadata.toJson(),
        "locations": List<dynamic>.from(locations.map((x) => x.toJson())),
        "facilities": List<dynamic>.from(facilities.map((x) => x.toJson())),
        "route": route.toJson(),
        "vessels": List<dynamic>.from(vessels.map((x) => x)),
        "containers": List<dynamic>.from(containers.map((x) => x.toJson())),
      };
}

class Container {
  final String number;
  final String isoCode;
  final String sizeType;
  final String status;
  final List<Event> events;

  Container({
    required this.number,
    required this.isoCode,
    required this.sizeType,
    required this.status,
    required this.events,
  });

  factory Container.fromJson(Map<String, dynamic> json) => Container(
        number: json["number"],
        isoCode: json["iso_code"],
        sizeType: json["size_type"],
        status: json["status"],
        events: List<Event>.from(json["events"].map((x) => Event.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "number": number,
        "iso_code": isoCode,
        "size_type": sizeType,
        "status": status,
        "events": List<dynamic>.from(events.map((x) => x.toJson())),
      };
}

class Event {
  final int orderId;
  final int location;
  final int facility;
  final String description;
  final String eventType;
  final String eventCode;
  final String status;
  final DateTime date;
  final bool actual;
  final bool isAdditionalEvent;
  final String type;
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

  factory Event.fromJson(Map<String, dynamic> json) => Event(
        orderId: json["order_id"],
        location: json["location"],
        facility: json["facility"],
        description: json["description"],
        eventType: json["event_type"],
        eventCode: json["event_code"],
        status: json["status"],
        date: DateTime.parse(json["date"]),
        actual: json["actual"],
        isAdditionalEvent: json["is_additional_event"],
        type: json["type"],
        transportType: json["transport_type"],
        vessel: json["vessel"],
        voyage: json["voyage"],
      );

  Map<String, dynamic> toJson() => {
        "order_id": orderId,
        "location": location,
        "facility": facility,
        "description": description,
        "event_type": eventType,
        "event_code": eventCode,
        "status": status,
        "date": date.toIso8601String(),
        "actual": actual,
        "is_additional_event": isAdditionalEvent,
        "type": type,
        "transport_type": transportType,
        "vessel": vessel,
        "voyage": voyage,
      };
}

class Facility {
  final int id;
  final String name;
  final String countryCode;
  final String locode;
  final String bicCode;
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

  factory Facility.fromJson(Map<String, dynamic> json) => Facility(
        id: json["id"],
        name: json["name"],
        countryCode: json["country_code"],
        locode: json["locode"],
        bicCode: json["bic_code"],
        smdgCode: json["smdg_code"],
        lat: json["lat"],
        lng: json["lng"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "country_code": countryCode,
        "locode": locode,
        "bic_code": bicCode,
        "smdg_code": smdgCode,
        "lat": lat,
        "lng": lng,
      };
}

class Location {
  final int id;
  final String name;
  final String state;
  final String country;
  final String countryCode;
  final String locode;
  final double lat;
  final double lng;
  final String timezone;

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

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        id: json["id"],
        name: json["name"],
        state: json["state"],
        country: json["country"],
        countryCode: json["country_code"],
        locode: json["locode"],
        lat: json["lat"]?.toDouble(),
        lng: json["lng"]?.toDouble(),
        timezone: json["timezone"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "state": state,
        "country": country,
        "country_code": countryCode,
        "locode": locode,
        "lat": lat,
        "lng": lng,
        "timezone": timezone,
      };
}

class Metadata {
  final String type;
  final String number;
  final String sealine;
  final String sealineName;
  final String status;
  final DateTime updatedAt;
  final ApiCalls apiCalls;
  final ApiCalls uniqueShipments;

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

  factory Metadata.fromJson(Map<String, dynamic> json) => Metadata(
        type: json["type"],
        number: json["number"],
        sealine: json["sealine"],
        sealineName: json["sealine_name"],
        status: json["status"],
        updatedAt: DateTime.parse(json["updated_at"]),
        apiCalls: ApiCalls.fromJson(json["api_calls"]),
        uniqueShipments: ApiCalls.fromJson(json["unique_shipments"]),
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "number": number,
        "sealine": sealine,
        "sealine_name": sealineName,
        "status": status,
        "updated_at": updatedAt.toIso8601String(),
        "api_calls": apiCalls.toJson(),
        "unique_shipments": uniqueShipments.toJson(),
      };
}

class ApiCalls {
  final int total;
  final int used;
  final int remaining;

  ApiCalls({
    required this.total,
    required this.used,
    required this.remaining,
  });

  factory ApiCalls.fromJson(Map<String, dynamic> json) => ApiCalls(
        total: json["total"],
        used: json["used"],
        remaining: json["remaining"],
      );

  Map<String, dynamic> toJson() => {
        "total": total,
        "used": used,
        "remaining": remaining,
      };
}

class Route {
  final Pod prepol;
  final Pod pol;
  final Pod pod;
  final Pod postpod;

  Route({
    required this.prepol,
    required this.pol,
    required this.pod,
    required this.postpod,
  });

  factory Route.fromJson(Map<String, dynamic> json) => Route(
        prepol: Pod.fromJson(json["prepol"]),
        pol: Pod.fromJson(json["pol"]),
        pod: Pod.fromJson(json["pod"]),
        postpod: Pod.fromJson(json["postpod"]),
      );

  Map<String, dynamic> toJson() => {
        "prepol": prepol.toJson(),
        "pol": pol.toJson(),
        "pod": pod.toJson(),
        "postpod": postpod.toJson(),
      };
}

class Pod {
  final dynamic location;
  final DateTime date;
  final bool actual;
  final dynamic predictiveEta;

  Pod({
    required this.location,
    required this.date,
    required this.actual,
    required this.predictiveEta,
  });

  factory Pod.fromJson(Map<String, dynamic> json) => Pod(
        location: json["location"],
        date: DateTime.parse(json["date"]),
        actual: json["actual"],
        predictiveEta: json["predictive_eta"],
      );

  Map<String, dynamic> toJson() => {
        "location": location,
        "date": date.toIso8601String(),
        "actual": actual,
        "predictive_eta": predictiveEta,
      };
}
