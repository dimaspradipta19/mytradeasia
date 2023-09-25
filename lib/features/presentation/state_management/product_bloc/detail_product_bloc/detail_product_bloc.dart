import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mytradeasia/features/domain/usecases/detail_product_usecases/get_detail_product.dart';

import '../../../../../core/resources/data_state.dart';
import 'detail_product_event.dart';
import 'detail_product_state.dart';

class DetailProductBloc extends Bloc<DetailProductEvent, DetailProductState> {
  final GetDetailProduct _getDetailProductUseCase;

  DetailProductBloc(this._getDetailProductUseCase)
      : super(const DetailProductLoading()) {
    on<GetDetailProductEvent>(onGetDetailProduct);
    on<DetailDispose>(onDispose);
  }

  void onDispose(DetailDispose event, Emitter<DetailProductState> emit) {
    emit(const DetailProductLoading());
  }

  void onGetDetailProduct(
      GetDetailProductEvent event, Emitter<DetailProductState> emit) async {
    final dataState = await _getDetailProductUseCase(param: event.product);

    if (dataState.data!.detailProduct == null) {
      emit(const DetailProductEmpty());
    }

    if (dataState is DataSuccess && dataState.data!.detailProduct != null) {
      emit(DetailProductDone(dataState.data!));
    }

    if (dataState is DataFailed) {
      emit(DetailProductError(dataState.error!));
    }
  }
}
