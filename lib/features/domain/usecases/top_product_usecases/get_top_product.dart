import 'package:mytradeasia/core/resources/data_state.dart';
import 'package:mytradeasia/core/usecase/usecase.dart';
import 'package:mytradeasia/features/domain/entities/top_products_entities/top_products_entity.dart';
import 'package:mytradeasia/features/domain/repository/top_product_repository.dart';

class GetTopProductUseCase
    implements UseCase<DataState<List<TopProductEntity>>, void> {
  final TopProductRepository _topProductRepository;

  GetTopProductUseCase(this._topProductRepository);

  @override
  Future<DataState<List<TopProductEntity>>> call({void param}) {
    return _topProductRepository.getTopProduct();
  }
}
