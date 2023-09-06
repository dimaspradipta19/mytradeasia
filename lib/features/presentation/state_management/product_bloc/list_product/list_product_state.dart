import 'package:equatable/equatable.dart';
import 'package:dio/dio.dart';
import 'package:mytradeasia/features/domain/entities/product_entities/all_product_entity.dart';

abstract class ListProductState extends Equatable {
  final List<AllProductEntities>? products;
  final DioException? error;

  const ListProductState({this.products, this.error});

  @override
  List<Object> get props => [products!, error!];
}

class ListProductLoading extends ListProductState {
  const ListProductLoading();
}

class ListProductDone extends ListProductState {
  const ListProductDone(List<AllProductEntities> product)
      : super(products: product);
}

class ListProductError extends ListProductState {
  const ListProductError(DioException error) : super(error: error);
}
