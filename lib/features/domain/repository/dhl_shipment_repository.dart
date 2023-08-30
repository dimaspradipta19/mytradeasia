import 'package:mytradeasia/core/resources/data_state.dart';
import 'package:mytradeasia/features/domain/entities/dhl_shipment_entities/dhl_shipment_entity.dart';

abstract class DhlShipmentRepo {
  Future<DataState<List<DhlShipmentEntity>>> getDhlShipment(
      String trackingNumber);
}
