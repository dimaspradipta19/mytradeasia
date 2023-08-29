import 'package:mytradeasia/core/resources/data_state.dart';
import 'package:mytradeasia/core/usecase/usecase.dart';
import 'package:mytradeasia/features/domain/entities/search_product_entities/search_product_entity.dart';
import 'package:mytradeasia/features/domain/repository/search_product_repository.dart';

class GetTopProduct
    implements UseCase<DataState<List<SearchProductEntity>>, void> {
  final SearchProductRepo _searchProductRepo;

  GetTopProduct(this._searchProductRepo);

  @override
  Future<DataState<List<SearchProductEntity>>> call({void param}) {
    return _searchProductRepo.getSearchProduct();
  }
}
