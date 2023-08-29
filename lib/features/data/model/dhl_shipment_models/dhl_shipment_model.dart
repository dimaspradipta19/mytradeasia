import 'package:mytradeasia/features/domain/entities/dhl_shipment_entities/dhl_shipment_entity.dart';

class DhlShipmentModel extends DhlShipmentEntity {
  const DhlShipmentModel({
    List<ShipmentModel>? shipments,
  }) : super(shipments: shipments);

  factory DhlShipmentModel.fromJson(Map<String, dynamic> json) =>
      DhlShipmentModel(
        shipments: List<ShipmentModel>.from(
            json["shipments"].map((x) => ShipmentModel.fromJson(x))),
      );
}

class ShipmentModel extends Shipment {
  const ShipmentModel({
    String? id,
    String? service,
    DestinationModel? origin,
    DestinationModel? destination,
    StatusModel? status,
    DetailsModel? details,
    List<EventModel>? events,
  }) : super(
          id: id,
          service: service,
          origin: origin,
          destination: destination,
          status: status,
          details: details,
          events: events,
        );

  factory ShipmentModel.fromJson(Map<String, dynamic> json) => ShipmentModel(
        id: json["id"],
        service: json["service"],
        origin: DestinationModel.fromJson(json["origin"]),
        destination: DestinationModel.fromJson(json["destination"]),
        status: StatusModel.fromJson(json["status"]),
        details: DetailsModel.fromJson(json["details"]),
        events: List<EventModel>.from(
            json["events"].map((x) => EventModel.fromJson(x))),
      );
}

class DestinationModel extends Destination {
  const DestinationModel({
    AddressModel? address,
    ServicePoint? servicePoint,
  }) : super(address: address, servicePoint: servicePoint);

  factory DestinationModel.fromJson(Map<String, dynamic> json) =>
      DestinationModel(
        address: AddressModel.fromJson(json["address"]),
        servicePoint: ServicePointModel.fromJson(json["servicePoint"]),
      );
}

class AddressModel extends Address {
  const AddressModel({String? addressLocality})
      : super(addressLocality: addressLocality);

  factory AddressModel.fromJson(Map<String, dynamic> json) => AddressModel(
        addressLocality: json["addressLocality"],
      );
}

class ServicePointModel extends ServicePoint {
  const ServicePointModel({
    String? url,
    String? label,
  }) : super(url: url, label: label);

  factory ServicePointModel.fromJson(Map<String, dynamic> json) =>
      ServicePointModel(
        url: json["url"],
        label: json["label"],
      );
}

class DetailsModel extends Details {
  const DetailsModel(
      {ProofOfDeliveryModel? proofOfDelivery,
      bool? proofOfDeliverySignedAvailable,
      int? totalNumberOfPieces,
      List<String>? pieceIds})
      : super(
            proofOfDelivery: proofOfDelivery,
            proofOfDeliverySignedAvailable: proofOfDeliverySignedAvailable,
            totalNumberOfPieces: totalNumberOfPieces,
            pieceIds: pieceIds);

  factory DetailsModel.fromJson(Map<String, dynamic> json) => DetailsModel(
        proofOfDelivery: ProofOfDeliveryModel.fromJson(json["proofOfDelivery"]),
        proofOfDeliverySignedAvailable: json["proofOfDeliverySignedAvailable"],
        totalNumberOfPieces: json["totalNumberOfPieces"],
        pieceIds: json["pieceIds"],
      );
}

class ProofOfDeliveryModel extends ProofOfDelivery {
  const ProofOfDeliveryModel({
    DateTime? timestamp,
    String? signatureUrl,
    String? documentUrl,
  }) : super(
          timestamp: timestamp,
          signatureUrl: signatureUrl,
          documentUrl: documentUrl,
        );

  factory ProofOfDeliveryModel.fromJson(Map<String, dynamic> json) =>
      ProofOfDeliveryModel(
        timestamp: DateTime.parse(json["timestamp"]),
        signatureUrl: json["signatureUrl"],
        documentUrl: json["documentUrl"],
      );
}

class EventModel extends Event {
  const EventModel({
    DateTime? timestamp,
    LocationModel? location,
    String? description,
    List<String>? pieceIds,
  }) : super(
            timestamp: timestamp,
            location: location,
            description: description,
            pieceIds: pieceIds);

  factory EventModel.fromJson(Map<String, dynamic> json) => EventModel(
        timestamp: DateTime.parse(json["timestamp"]),
        location: LocationModel.fromJson(json["location"]),
        description: json["description"],
        pieceIds: json["pieceIds"],
      );
}

class LocationModel extends Location {
  const LocationModel({
    AddressModel? address,
  }) : super(address: address);

  factory LocationModel.fromJson(Map<String, dynamic> json) => LocationModel(
        address: AddressModel.fromJson(json["address"]),
      );
}

class StatusModel extends Status {
  const StatusModel({
    DateTime? timestamp,
    LocationModel? location,
    String? statusCode,
    String? status,
    String? description,
  }) : super(
          timestamp: timestamp,
          location: location,
          statusCode: statusCode,
          status: status,
          description: description,
        );

  factory StatusModel.fromJson(Map<String, dynamic> json) => StatusModel(
        timestamp: DateTime.parse(json["timestamp"]),
        location: LocationModel.fromJson(json["location"]),
        statusCode: json["statusCode"],
        status: json["status"],
        description: json["description"],
      );
}
