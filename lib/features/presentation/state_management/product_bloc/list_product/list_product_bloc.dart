import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mytradeasia/core/resources/data_state.dart';
import 'package:mytradeasia/features/domain/usecases/list_product_usecases/get_list_product.dart';
import 'package:mytradeasia/features/presentation/state_management/product_bloc/list_product/list_product_event.dart';
import 'package:mytradeasia/features/presentation/state_management/product_bloc/list_product/list_product_state.dart';

class ListProductBloc extends Bloc<ListProductEvent, ListProductState> {
  final GetListProduct _getListProduct;

  ListProductBloc(this._getListProduct) : super(const ListProductLoading()) {
    on<GetProducts>(onGetProducts);
  }

  void onGetProducts(GetProducts event, Emitter<ListProductState> emit) async {
    final dataState = await _getListProduct();

    if (dataState is DataSuccess && dataState.data!.isNotEmpty) {
      emit(ListProductDone(dataState.data!));
    }

    if (dataState is DataFailed) {
      emit(ListProductError(dataState.error!));
    }
  }
}
