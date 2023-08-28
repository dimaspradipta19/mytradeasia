import 'package:mytradeasia/features/domain/entities/dhl_shipment_entities/object_class/destination.dart';
import 'package:mytradeasia/features/domain/entities/dhl_shipment_entities/object_class/details.dart';
import 'package:mytradeasia/features/domain/entities/dhl_shipment_entities/object_class/event.dart';
import 'package:mytradeasia/features/domain/entities/dhl_shipment_entities/object_class/status.dart';

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
