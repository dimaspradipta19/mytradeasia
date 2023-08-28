import 'package:mytradeasia/features/domain/entities/dhl_shipment_entities/object_class/address.dart';
import 'package:mytradeasia/features/domain/entities/dhl_shipment_entities/object_class/service_point.dart';

class Destination {
  final Address? address;
  final ServicePoint? servicePoint;

  const Destination({
    required this.address,
    required this.servicePoint,
  });
}
