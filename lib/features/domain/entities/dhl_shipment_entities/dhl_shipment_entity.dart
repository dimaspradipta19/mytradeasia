import 'package:equatable/equatable.dart';

class DhlShipmentEntity extends Equatable {
  final List<Shipment>? shipments;

  const DhlShipmentEntity({
    required this.shipments,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [shipments];
}

class Shipment {
  final String? id;
  final String? service;
  final Destination? origin;
  final Destination? destination;
  final Status? status;
  final Details? details;
  final List<Event>? events;

  const Shipment({
    required this.id,
    required this.service,
    required this.origin,
    required this.destination,
    required this.status,
    required this.details,
    required this.events,
  });
}

class Destination {
  final Address? address;
  final ServicePoint? servicePoint;

  const Destination({
    required this.address,
    required this.servicePoint,
  });
}

class Address {
  final String? addressLocality;

  const Address({
    required this.addressLocality,
  });
}

class ServicePoint {
  final String? url;
  final String? label;

  const ServicePoint({
    required this.url,
    required this.label,
  });
}

class Details {
  final ProofOfDelivery? proofOfDelivery;
  final bool? proofOfDeliverySignedAvailable;
  final int? totalNumberOfPieces;
  final List<dynamic>? pieceIds;

  const Details({
    required this.proofOfDelivery,
    required this.proofOfDeliverySignedAvailable,
    required this.totalNumberOfPieces,
    required this.pieceIds,
  });
}

class ProofOfDelivery {
  final DateTime? timestamp;
  final String? signatureUrl;
  final String? documentUrl;

  const ProofOfDelivery({
    required this.timestamp,
    required this.signatureUrl,
    required this.documentUrl,
  });
}

class Event {
  final DateTime? timestamp;
  final Location? location;
  final String? description;
  final List<dynamic>? pieceIds;

  const Event({
    required this.timestamp,
    required this.location,
    required this.description,
    required this.pieceIds,
  });
}

class Location {
  final Address? address;

  const Location({
    required this.address,
  });
}

class Status {
  final DateTime? timestamp;
  final Location? location;
  final String? statusCode;
  final String? status;
  final String? description;

  const Status({
    required this.timestamp,
    required this.location,
    required this.statusCode,
    required this.status,
    required this.description,
  });
}
