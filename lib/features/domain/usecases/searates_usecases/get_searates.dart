import 'package:mytradeasia/core/resources/data_state.dart';
import 'package:mytradeasia/core/usecase/usecase.dart';
import 'package:mytradeasia/features/domain/entities/sea_reates_entities/sea_rates_entity.dart';
import 'package:mytradeasia/features/domain/repository/sea_rates_repository.dart';

class GetSearates implements UseCase<DataState<SearatesEntity>, void> {
  final SearatesRepo _searatesRepo;

  GetSearates(this._searatesRepo);

  @override
  Future<DataState<SearatesEntity>> call({void param}) {
    return _searatesRepo.getSearates();
  }
}
