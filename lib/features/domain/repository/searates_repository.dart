import 'package:mytradeasia/core/resources/data_state.dart';
import 'package:mytradeasia/features/domain/entities/searates_entities/searates_route_entity.dart';

abstract class SearatesRepository {
  Future<DataState<SearatesRouteEntity>> getRoute(
      {required String number, required String type, required String sealine});
}
