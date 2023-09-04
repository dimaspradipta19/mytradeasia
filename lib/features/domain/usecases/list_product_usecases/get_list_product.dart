import 'dart:developer';

import 'package:mytradeasia/core/resources/data_state.dart';
import 'package:mytradeasia/core/usecase/usecase.dart';
import 'package:mytradeasia/features/domain/entities/product_entities/all_product_entity.dart';
import 'package:mytradeasia/features/domain/repository/list_product_repository.dart';

class GetListProduct
    implements UseCase<DataState<List<AllProductEntities>>, void> {
  final ListProductRepository _listProductRepository;

  GetListProduct(this._listProductRepository);

  @override
  Future<DataState<List<AllProductEntities>>> call({void param}) {
    log("USECASE : ${_listProductRepository.getListProduct()} ");
    return _listProductRepository.getListProduct();
  }
}
