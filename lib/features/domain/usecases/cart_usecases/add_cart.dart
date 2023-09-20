import 'package:mytradeasia/core/usecase/usecase.dart';
import 'package:mytradeasia/features/data/model/cart_models/cart_models.dart';
import 'package:mytradeasia/features/domain/repository/cart_repository.dart';

class AddCart implements UseCase<String, CartModel> {
  final CartRepository _cartRepository;

  AddCart(this._cartRepository);

  @override
  Future<String> call({required CartModel param}) {
    return _cartRepository.addCartItem(param);
  }
}
