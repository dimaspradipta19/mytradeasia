import 'package:mytradeasia/core/resources/data_state.dart';
import 'package:mytradeasia/features/domain/entities/sales_force_detail_entities/sales_force_detail_entity.dart';

abstract class SalesForceDetailRepo {
  Future<DataState<SalesforceDetailEntity>> getSalesForceDetail(
      Map<String, dynamic> detailData);
}
