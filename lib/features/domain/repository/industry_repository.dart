import 'package:mytradeasia/core/resources/data_state.dart';
import 'package:mytradeasia/features/domain/entities/all_industry_entities/all_industry_entity.dart';

abstract class IndustryRepository {
  Future<DataState<List<AllIndustryEntity>>> getAllIndustryData();
}
