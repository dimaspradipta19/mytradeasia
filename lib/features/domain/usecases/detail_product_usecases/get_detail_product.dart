import 'package:mytradeasia/core/resources/data_state.dart';
import 'package:mytradeasia/core/usecase/usecase.dart';
import 'package:mytradeasia/features/domain/entities/detail_product_entities/detail_product_entities.dart';
import 'package:mytradeasia/features/domain/repository/detail_product_repository.dart';

class GetDetailProduct
    implements UseCase<DataState<DetailsProductEntity>, String> {
  final DetailProductRepository _detailProductRepository;

  GetDetailProduct(this._detailProductRepository);

  @override
  Future<DataState<DetailsProductEntity>> call({String? param}) {
    return _detailProductRepository.getDetailProductRepo(param!);
  }
}
