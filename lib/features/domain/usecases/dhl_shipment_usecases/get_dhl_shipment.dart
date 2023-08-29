import 'package:mytradeasia/core/resources/data_state.dart';
import 'package:mytradeasia/core/usecase/usecase.dart';
import 'package:mytradeasia/features/domain/entities/dhl_shipment_entities/dhl_shipment_entity.dart';
import 'package:mytradeasia/features/domain/repository/dhl_shipment_repository.dart';

class GetDhlShipment
    implements UseCase<DataState<List<DhlShipmentEntity>>, void> {
  final DhlShipmentRepo _dhlShipmentRepo;

  GetDhlShipment(this._dhlShipmentRepo);

  @override
  Future<DataState<List<DhlShipmentEntity>>> call({void param}) {
    return _dhlShipmentRepo.getDhlShipment();
  }
}
