import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mytradeasia/features/domain/usecases/top_product_usecases/get_top_product.dart';

import '../../../../core/resources/data_state.dart';
import 'top_products_event.dart';
import 'top_products_state.dart';

class TopProductBloc extends Bloc<TopProductEvent, TopProductState> {
  final GetTopProductUseCase _getTopProductUseCase;

  TopProductBloc(this._getTopProductUseCase)
      : super(const TopProductLoading()) {
    on<GetTopProduct>(onGetTopProduct);
  }

  void onGetTopProduct(
      GetTopProduct event, Emitter<TopProductState> emit) async {
    final dataState = await _getTopProductUseCase();

    if (dataState is DataSuccess && dataState.data!.isNotEmpty) {
      emit(TopProductDone(dataState.data!));
    }

    if (dataState is DataFailed) {
      emit(TopProductError(dataState.error!));
    }
  }
}
