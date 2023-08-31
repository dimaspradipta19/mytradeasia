import 'package:mytradeasia/core/resources/data_state.dart';
import 'package:mytradeasia/core/usecase/usecase.dart';
import 'package:mytradeasia/features/domain/entities/sales_force_login_entities/sales_force_login_entity.dart';
import 'package:mytradeasia/features/domain/repository/sales_force_login_repository.dart';

class GetSalesforceLogin
    implements UseCase<DataState<SalesforceLoginEntity>, void> {
  final SalesforceLoginRepo _salesforceLoginRepo;

  GetSalesforceLogin(this._salesforceLoginRepo);

  @override
  Future<DataState<SalesforceLoginEntity>> call({void param}) {
    return _salesforceLoginRepo.getSalesforceLogin();
  }
}
