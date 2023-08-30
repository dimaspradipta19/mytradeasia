import 'package:mytradeasia/core/resources/data_state.dart';
import 'package:mytradeasia/core/usecase/usecase.dart';
import 'package:mytradeasia/features/domain/entities/sales_force_detail_entities/sales_force_detail_entity.dart';
import 'package:mytradeasia/features/domain/repository/sales_force_detail_repository.dart';

class GetSalesforceDetail
    implements UseCase<DataState<List<SalesforceDetailEntity>>, void> {
  final SalesForceDetailRepo _salesForceDetailRepo;

  GetSalesforceDetail(this._salesForceDetailRepo);

  @override
  Future<DataState<List<SalesforceDetailEntity>>> call({void param}) {
    return _salesForceDetailRepo.getSalesForceDetail();
  }
}