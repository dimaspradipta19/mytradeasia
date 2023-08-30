import 'package:mytradeasia/features/domain/entities/dhl_shipment_entities/dhl_shipment_entity.dart';

class DhlShipmentModel extends DhlShipmentEntity {
  const DhlShipmentModel({
    List<_ShipmentModel>? shipments,
  }) : super(shipments: shipments);

  factory DhlShipmentModel.fromJson(Map<String, dynamic> json) =>
      DhlShipmentModel(
        shipments: List<_ShipmentModel>.from(
            json["shipments"].map((x) => _ShipmentModel.fromJson(x))),
      );
}

class _ShipmentModel extends Shipment {
  const _ShipmentModel({
    String? id,
    String? service,
    _DestinationModel? origin,
    _DestinationModel? destination,
    _StatusModel? status,
    _DetailsModel? details,
    List<_EventModel>? events,
  }) : super(
          id: id,
          service: service,
          origin: origin,
          destination: destination,
          status: status,
          details: details,
          events: events,
        );

  factory _ShipmentModel.fromJson(Map<String, dynamic> json) => _ShipmentModel(
        id: json["id"],
        service: json["service"],
        origin: _DestinationModel.fromJson(json["origin"]),
        destination: _DestinationModel.fromJson(json["destination"]),
        status: _StatusModel.fromJson(json["status"]),
        details: _DetailsModel.fromJson(json["details"]),
        events: List<_EventModel>.from(
            json["events"].map((x) => _EventModel.fromJson(x))),
      );
}

class _DestinationModel extends Destination {
  const _DestinationModel({
    _AddressModel? address,
    _ServicePointModel? servicePoint,
  }) : super(address: address, servicePoint: servicePoint);

  factory _DestinationModel.fromJson(Map<String, dynamic> json) =>
      _DestinationModel(
        address: _AddressModel.fromJson(json["address"]),
        servicePoint: _ServicePointModel.fromJson(json["servicePoint"]),
      );
}

class _AddressModel extends Address {
  const _AddressModel({String? addressLocality})
      : super(addressLocality: addressLocality);

  factory _AddressModel.fromJson(Map<String, dynamic> json) => _AddressModel(
        addressLocality: json["addressLocality"],
      );
}

class _ServicePointModel extends ServicePoint {
  const _ServicePointModel({
    String? url,
    String? label,
  }) : super(url: url, label: label);

  factory _ServicePointModel.fromJson(Map<String, dynamic> json) =>
      _ServicePointModel(
        url: json["url"],
        label: json["label"],
      );
}

class _DetailsModel extends Details {
  const _DetailsModel(
      {_ProofOfDeliveryModel? proofOfDelivery,
      bool? proofOfDeliverySignedAvailable,
      int? totalNumberOfPieces,
      List<String>? pieceIds})
      : super(
            proofOfDelivery: proofOfDelivery,
            proofOfDeliverySignedAvailable: proofOfDeliverySignedAvailable,
            totalNumberOfPieces: totalNumberOfPieces,
            pieceIds: pieceIds);

  factory _DetailsModel.fromJson(Map<String, dynamic> json) => _DetailsModel(
        proofOfDelivery:
            _ProofOfDeliveryModel.fromJson(json["proofOfDelivery"]),
        proofOfDeliverySignedAvailable: json["proofOfDeliverySignedAvailable"],
        totalNumberOfPieces: json["totalNumberOfPieces"],
        pieceIds: json["pieceIds"],
      );
}

class _ProofOfDeliveryModel extends ProofOfDelivery {
  const _ProofOfDeliveryModel({
    DateTime? timestamp,
    String? signatureUrl,
    String? documentUrl,
  }) : super(
          timestamp: timestamp,
          signatureUrl: signatureUrl,
          documentUrl: documentUrl,
        );

  factory _ProofOfDeliveryModel.fromJson(Map<String, dynamic> json) =>
      _ProofOfDeliveryModel(
        timestamp: DateTime.parse(json["timestamp"]),
        signatureUrl: json["signatureUrl"],
        documentUrl: json["documentUrl"],
      );
}

class _EventModel extends Event {
  const _EventModel({
    DateTime? timestamp,
    _LocationModel? location,
    String? description,
    List<String>? pieceIds,
  }) : super(
            timestamp: timestamp,
            location: location,
            description: description,
            pieceIds: pieceIds);

  factory _EventModel.fromJson(Map<String, dynamic> json) => _EventModel(
        timestamp: DateTime.parse(json["timestamp"]),
        location: _LocationModel.fromJson(json["location"]),
        description: json["description"],
        pieceIds: json["pieceIds"],
      );
}

class _LocationModel extends Location {
  const _LocationModel({
    _AddressModel? address,
  }) : super(address: address);

  factory _LocationModel.fromJson(Map<String, dynamic> json) => _LocationModel(
        address: _AddressModel.fromJson(json["address"]),
      );
}

class _StatusModel extends Status {
  const _StatusModel({
    DateTime? timestamp,
    _LocationModel? location,
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

  factory _StatusModel.fromJson(Map<String, dynamic> json) => _StatusModel(
        timestamp: DateTime.parse(json["timestamp"]),
        location: _LocationModel.fromJson(json["location"]),
        statusCode: json["statusCode"],
        status: json["status"],
        description: json["description"],
      );
}
