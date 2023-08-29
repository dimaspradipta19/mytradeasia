import 'package:mytradeasia/core/resources/data_state.dart';
import 'package:mytradeasia/features/domain/entities/top_products_entities/top_products_entity.dart';

abstract class TopProductRepository {
  Future<DataState<List<TopProductEntity>>> getTopProduct();
}
