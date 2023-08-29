import 'package:mytradeasia/core/resources/data_state.dart';
import 'package:mytradeasia/features/domain/entities/sales_force_data_entities/sales_force_data_entity.dart';

abstract class SalesForceDetailRepo {
  Future<DataState<List<SalesforceDataEntity>>> getSalesForceDetail();
}
