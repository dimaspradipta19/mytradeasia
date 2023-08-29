import 'package:mytradeasia/core/resources/data_state.dart';
import 'package:mytradeasia/features/domain/entities/search_product_entities/search_product_entity.dart';

abstract class SearchProductRepo {
  Future<DataState<List<SearchProductEntity>>> getSearchProduct();
}
