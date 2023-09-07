import 'package:mytradeasia/core/resources/data_state.dart';
import 'package:mytradeasia/core/usecase/usecase.dart';
import 'package:mytradeasia/features/domain/entities/search_product_entities/search_product_entity.dart';
import 'package:mytradeasia/features/domain/repository/search_product_repository.dart';

class GetSearchProduct
    implements UseCase<DataState<List<SearchProductEntity>>, String> {
  final SearchProductRepo _searchProductRepo;

  GetSearchProduct(this._searchProductRepo);

  @override
  Future<DataState<List<SearchProductEntity>>> call({required String? param}) {
    return _searchProductRepo.getSearchProduct(param!);
  }
}
