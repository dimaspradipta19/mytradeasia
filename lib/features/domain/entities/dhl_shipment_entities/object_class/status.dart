import 'package:mytradeasia/features/domain/entities/dhl_shipment_entities/object_class/location.dart';

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
