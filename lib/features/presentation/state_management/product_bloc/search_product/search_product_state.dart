import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:mytradeasia/features/domain/entities/search_product_entities/search_product_entity.dart';

abstract class SearchProductState extends Equatable {
  final List<SearchProductEntity>? searchProducts;
  final DioException? error;

  const SearchProductState({this.searchProducts, this.error});

  @override
  List<Object?> get props => [searchProducts, error];
}

class SearchProductInitial extends SearchProductState {
  const SearchProductInitial();
}

class SearchProductLoading extends SearchProductState {
  const SearchProductLoading();
}

class SearchProductDone extends SearchProductState {
  const SearchProductDone(List<SearchProductEntity> products)
      : super(searchProducts: products);
}

class SearchProductError extends SearchProductState {
  const SearchProductError(DioException error) : super(error: error);
}
