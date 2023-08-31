import 'package:mytradeasia/core/resources/data_state.dart';
import 'package:mytradeasia/features/domain/entities/sales_force_login_entities/sales_force_login_entity.dart';

abstract class SalesforceLoginRepo {
  Future<DataState<SalesforceLoginEntity>> getSalesforceLogin();
}
