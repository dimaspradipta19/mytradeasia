import 'package:mytradeasia/core/resources/data_state.dart';
import 'package:mytradeasia/core/usecase/usecase.dart';
import 'package:mytradeasia/features/domain/entities/dhl_shipment_entities/dhl_shipment_entity.dart';
import 'package:mytradeasia/features/domain/repository/dhl_shipment_repository.dart';

class GetDhlShipment implements UseCase<DataState<DhlShipmentEntity>, String> {
  final DhlShipmentRepo _dhlShipmentRepo;

  GetDhlShipment(this._dhlShipmentRepo);

  //TODO: change to required parameter
  @override
  Future<DataState<DhlShipmentEntity>> call({required String? param}) {
    return _dhlShipmentRepo.getDhlShipment(param!);
  }
}
