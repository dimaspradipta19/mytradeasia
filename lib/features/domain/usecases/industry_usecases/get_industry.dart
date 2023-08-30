import 'package:mytradeasia/core/resources/data_state.dart';
import 'package:mytradeasia/core/usecase/usecase.dart';
import 'package:mytradeasia/features/domain/entities/all_industry_entities/all_industry_entity.dart';
import 'package:mytradeasia/features/domain/repository/industry_repository.dart';

class GetIndustryData implements UseCase<DataState<AllIndustryEntity>, void> {
  final IndustryRepository _industryRepository;

  GetIndustryData(this._industryRepository);

  @override
  Future<DataState<AllIndustryEntity>> call({void param}) {
    return _industryRepository.getAllIndustryData();
  }
}
