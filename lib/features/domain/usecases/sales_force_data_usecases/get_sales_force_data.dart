import 'package:mytradeasia/core/resources/data_state.dart';
import 'package:mytradeasia/core/usecase/usecase.dart';
import 'package:mytradeasia/features/domain/entities/sales_force_data_entities/sales_force_data_entity.dart';
import 'package:mytradeasia/features/domain/repository/sales_force_data_repository.dart';

class GetSalesForceData
    implements UseCase<DataState<List<SalesforceDataEntity>>, String> {
  final SalesForceDataRepository _salesForceDataRepository;

  GetSalesForceData(this._salesForceDataRepository);

  @override
  Future<DataState<List<SalesforceDataEntity>>> call({String? param}) {
    return _salesForceDataRepository.getSalesForceData(param!);
  }
}
