import 'package:mytradeasia/core/resources/data_state.dart';
import 'package:mytradeasia/features/domain/entities/detail_product_entities/detail_product_entities.dart';

abstract class DetailProductRepository {
  Future<DataState<List<DetailsProductEntity>>> getDetailProductRepo(
      String seoUrl);
}
