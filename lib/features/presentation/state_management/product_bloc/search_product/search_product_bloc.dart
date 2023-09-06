import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mytradeasia/core/resources/data_state.dart';
import 'package:mytradeasia/features/domain/usecases/search_product_usecases/get_search_product.dart';
import 'package:mytradeasia/features/presentation/state_management/product_bloc/search_product/search_product_event.dart';
import 'package:mytradeasia/features/presentation/state_management/product_bloc/search_product/search_product_state.dart';

class SearchProductBloc extends Bloc<SearchProductEvent, SearchProductState> {
  final GetSearchProduct _getSearchProduct;
  SearchProductBloc(this._getSearchProduct)
      : super(const SearchProductLoading()) {
    on<SearchProduct>(onSearchProduct);
  }

  void onSearchProduct(
      SearchProduct event, Emitter<SearchProductState> emit) async {
    final dataState = await _getSearchProduct(param: event.query);
    if (dataState is DataSuccess) {
      emit(SearchProductDone(dataState.data!));
    }
    if (dataState is DataFailed) {
      emit(SearchProductError(dataState.error!));
    }
  }
}
