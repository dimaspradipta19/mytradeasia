import 'package:mytradeasia/core/resources/data_state.dart';
import 'package:mytradeasia/core/usecase/usecase.dart';
import 'package:mytradeasia/features/domain/entities/searates_entities/searates_route_entity.dart';
import 'package:mytradeasia/features/domain/repository/searates_repository.dart';

class GetSearatesRoute
    implements
        UseCaseThreeParams<DataState<SearatesRouteEntity>, String, String,
            String> {
  final SearatesRepository _searatesRepository;

  GetSearatesRoute(this._searatesRepository);

  @override
  Future<DataState<SearatesRouteEntity>> call(
      {required String paramsOne,
      required String paramsTwo,
      required String paramsThree}) {
    return _searatesRepository.getRoute(
        number: paramsOne, type: paramsTwo, sealine: paramsThree);
  }
}
