import 'package:mytradeasia/core/usecase/usecase.dart';
import 'package:mytradeasia/features/data/model/cart_models/cart_models.dart';
import 'package:mytradeasia/features/domain/repository/cart_repository.dart';

class DeleteCartItem implements UseCase<void, List<CartModel>> {
  final CartRepository _cartRepository;

  DeleteCartItem(this._cartRepository);

  @override
  Future<String> call({required List<CartModel> param}) {
    return _cartRepository.deleteCartItems(param);
  }
}
