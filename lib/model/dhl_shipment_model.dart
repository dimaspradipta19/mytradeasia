// To parse this JSON data, do
//
//     final dhlShipmentModel = dhlShipmentModelFromJson(jsonString);

// import 'package:meta/meta.dart';
// import 'dart:convert';

// DhlShipmentModel dhlShipmentModelFromJson(String str) =>
//     DhlShipmentModel.fromJson(json.decode(str));

// String dhlShipmentModelToJson(DhlShipmentModel data) =>
//     json.encode(data.toJson());

class DhlShipmentModel {
  final List<Shipment> shipments;

  DhlShipmentModel({
    required this.shipments,
  });

  factory DhlShipmentModel.fromJson(Map<String, dynamic> json) =>
      DhlShipmentModel(
        shipments: List<Shipment>.from(
            json["shipments"].map((x) => Shipment.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "shipments": List<dynamic>.from(shipments.map((x) => x.toJson())),
      };
}

class Shipment {
  final String id;
  final String service;
  final Destination origin;
  final Destination destination;
  final Status status;
  final Details details;
  final List<Event> events;

  Shipment({
    required this.id,
    required this.service,
    required this.origin,
    required this.destination,
    required this.status,
    required this.details,
    required this.events,
  });

  factory Shipment.fromJson(Map<String, dynamic> json) => Shipment(
        id: json["id"],
        service: json["service"],
        origin: Destination.fromJson(json["origin"]),
        destination: Destination.fromJson(json["destination"]),
        status: Status.fromJson(json["status"]),
        details: Details.fromJson(json["details"]),
        events: List<Event>.from(json["events"].map((x) => Event.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "service": service,
        "origin": origin.toJson(),
        "destination": destination.toJson(),
        "status": status.toJson(),
        "details": details.toJson(),
        "events": List<dynamic>.from(events.map((x) => x.toJson())),
      };
}

class Destination {
  final Address address;
  final ServicePoint servicePoint;

  Destination({
    required this.address,
    required this.servicePoint,
  });

  factory Destination.fromJson(Map<String, dynamic> json) => Destination(
        address: Address.fromJson(json["address"]),
        servicePoint: ServicePoint.fromJson(json["servicePoint"]),
      );

  Map<String, dynamic> toJson() => {
        "address": address.toJson(),
        "servicePoint": servicePoint.toJson(),
      };
}

class Address {
  final String addressLocality;

  Address({
    required this.addressLocality,
  });

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        addressLocality: json["addressLocality"],
      );

  Map<String, dynamic> toJson() => {
        "addressLocality": addressLocality,
      };
}

class ServicePoint {
  final String url;
  final String label;

  ServicePoint({
    required this.url,
    required this.label,
  });

  factory ServicePoint.fromJson(Map<String, dynamic> json) => ServicePoint(
        url: json["url"],
        label: json["label"],
      );

  Map<String, dynamic> toJson() => {
        "url": url,
        "label": label,
      };
}

class Details {
  final ProofOfDelivery proofOfDelivery;
  final bool proofOfDeliverySignedAvailable;
  final int totalNumberOfPieces;
  final List<PieceId> pieceIds;

  Details({
    required this.proofOfDelivery,
    required this.proofOfDeliverySignedAvailable,
    required this.totalNumberOfPieces,
    required this.pieceIds,
  });

  factory Details.fromJson(Map<String, dynamic> json) => Details(
        proofOfDelivery: ProofOfDelivery.fromJson(json["proofOfDelivery"]),
        proofOfDeliverySignedAvailable: json["proofOfDeliverySignedAvailable"],
        totalNumberOfPieces: json["totalNumberOfPieces"],
        pieceIds: List<PieceId>.from(
            json["pieceIds"].map((x) => pieceIdValues.map[x]!)),
      );

  Map<String, dynamic> toJson() => {
        "proofOfDelivery": proofOfDelivery.toJson(),
        "proofOfDeliverySignedAvailable": proofOfDeliverySignedAvailable,
        "totalNumberOfPieces": totalNumberOfPieces,
        "pieceIds":
            List<dynamic>.from(pieceIds.map((x) => pieceIdValues.reverse[x])),
      };
}

// ignore: constant_identifier_names
enum PieceId { JD014600011060944492 }

final pieceIdValues =
    EnumValues({"JD014600011060944492": PieceId.JD014600011060944492});

class ProofOfDelivery {
  final DateTime timestamp;
  final String signatureUrl;
  final String documentUrl;

  ProofOfDelivery({
    required this.timestamp,
    required this.signatureUrl,
    required this.documentUrl,
  });

  factory ProofOfDelivery.fromJson(Map<String, dynamic> json) =>
      ProofOfDelivery(
        timestamp: DateTime.parse(json["timestamp"]),
        signatureUrl: json["signatureUrl"],
        documentUrl: json["documentUrl"],
      );

  Map<String, dynamic> toJson() => {
        "timestamp": timestamp.toIso8601String(),
        "signatureUrl": signatureUrl,
        "documentUrl": documentUrl,
      };
}

class Event {
  final DateTime timestamp;
  final Location location;
  final String description;
  final List<PieceId> pieceIds;

  Event({
    required this.timestamp,
    required this.location,
    required this.description,
    required this.pieceIds,
  });

  factory Event.fromJson(Map<String, dynamic> json) => Event(
        timestamp: DateTime.parse(json["timestamp"]),
        location: Location.fromJson(json["location"]),
        description: json["description"],
        pieceIds: List<PieceId>.from(
            json["pieceIds"].map((x) => pieceIdValues.map[x]!)),
      );

  Map<String, dynamic> toJson() => {
        "timestamp": timestamp.toIso8601String(),
        "location": location.toJson(),
        "description": description,
        "pieceIds":
            List<dynamic>.from(pieceIds.map((x) => pieceIdValues.reverse[x])),
      };
}

class Location {
  final Address address;

  Location({
    required this.address,
  });

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        address: Address.fromJson(json["address"]),
      );

  Map<String, dynamic> toJson() => {
        "address": address.toJson(),
      };
}

class Status {
  final DateTime timestamp;
  final Location location;
  final String statusCode;
  final String status;
  final String description;

  Status({
    required this.timestamp,
    required this.location,
    required this.statusCode,
    required this.status,
    required this.description,
  });

  factory Status.fromJson(Map<String, dynamic> json) => Status(
        timestamp: DateTime.parse(json["timestamp"]),
        location: Location.fromJson(json["location"]),
        statusCode: json["statusCode"],
        status: json["status"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "timestamp": timestamp.toIso8601String(),
        "location": location.toJson(),
        "statusCode": statusCode,
        "status": status,
        "description": description,
      };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
