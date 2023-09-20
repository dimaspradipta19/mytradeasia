import 'package:mytradeasia/core/usecase/usecase.dart';
import 'package:mytradeasia/features/data/model/cart_models/cart_models.dart';
import 'package:mytradeasia/features/domain/repository/cart_repository.dart';

class UpdateCart
    implements
        UseCaseFourParams<String, List<CartModel>, CartModel, double, String> {
  final CartRepository _cartRepository;

  UpdateCart(this._cartRepository);

  @override
  Future<String> call(
      {required List<CartModel> paramsOne,
      required CartModel paramsTwo,
      required double paramsThree,
      required String paramsFour}) {
    return _cartRepository.updateCartItem(
        cart: paramsOne,
        product: paramsTwo,
        quantity: paramsThree,
        unit: paramsFour);
  }
}
