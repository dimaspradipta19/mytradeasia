import 'package:mytradeasia/features/domain/entities/dhl_shipment_entities/object_class/location.dart';

class Event {
  final DateTime? timestamp;
  final Location? location;
  final String? description;
  final List<String>? pieceIds;

  const Event({
    required this.timestamp,
    required this.location,
    required this.description,
    required this.pieceIds,
  });
}
