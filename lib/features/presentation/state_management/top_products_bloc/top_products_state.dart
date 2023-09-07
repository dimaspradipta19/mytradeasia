import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:mytradeasia/features/domain/entities/top_products_entities/top_products_entity.dart';

abstract class TopProductState extends Equatable {
  final List<TopProductEntity>? topProductData;
  final DioException? error;

  const TopProductState({this.topProductData, this.error});

  @override
  List<Object> get props => [topProductData!, error!];
}

class TopProductLoading extends TopProductState {
  const TopProductLoading();
}

class TopProductDone extends TopProductState {
  const TopProductDone(List<TopProductEntity> topProductData)
      : super(topProductData: topProductData);
}

class TopProductError extends TopProductState {
  const TopProductError(DioException error) : super(error: error);
}
