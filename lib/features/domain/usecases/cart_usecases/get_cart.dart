import 'package:mytradeasia/core/usecase/usecase.dart';
import 'package:mytradeasia/features/data/model/cart_models/cart_models.dart';
import 'package:mytradeasia/features/domain/repository/cart_repository.dart';

class GetCart implements UseCase<List<CartModel>, void> {
  final CartRepository _cartRepository;

  GetCart(this._cartRepository);

  @override
  Future<List<CartModel>> call({void param}) {
    return _cartRepository.getCartItems();
  }
}
