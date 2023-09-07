import 'package:mytradeasia/core/resources/data_state.dart';
import 'package:mytradeasia/core/usecase/usecase.dart';
import 'package:mytradeasia/features/domain/entities/sales_force_detail_entities/sales_force_detail_entity.dart';
import 'package:mytradeasia/features/domain/repository/sales_force_detail_repository.dart';

class GetSalesforceDetail
    implements
        UseCase<DataState<SalesforceDetailEntity>, Map<String, dynamic>?> {
  final SalesForceDetailRepo _salesForceDetailRepo;

  GetSalesforceDetail(this._salesForceDetailRepo);

  @override
  Future<DataState<SalesforceDetailEntity>> call(
      {required Map<String, dynamic>? param}) {
    return _salesForceDetailRepo.getSalesForceDetail(param!);
  }
}
