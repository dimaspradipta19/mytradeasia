import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:mytradeasia/features/domain/entities/detail_product_entities/detail_product_entities.dart';

abstract class DetailProductState extends Equatable {
  final DetailsProductEntity? detailProductData;
  final DioException? error;

  const DetailProductState({this.detailProductData, this.error});

  @override
  List<Object> get props => [detailProductData!, error!];
}

class DetailProductLoading extends DetailProductState {
  const DetailProductLoading();
}

class DetailProductDone extends DetailProductState {
  const DetailProductDone(DetailsProductEntity detailProductData)
      : super(detailProductData: detailProductData);
}

class DetailProductError extends DetailProductState {
  const DetailProductError(DioException error) : super(error: error);
}
