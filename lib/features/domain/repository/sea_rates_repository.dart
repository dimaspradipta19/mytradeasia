import 'package:mytradeasia/core/resources/data_state.dart';

import '../entities/sea_reates_entities/sea_rates_entity.dart';

abstract class SearatesRepo {
  Future<DataState<SearatesEntity>> getSearates();
}
