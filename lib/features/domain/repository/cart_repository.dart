import 'package:mytradeasia/features/data/model/cart_models/cart_models.dart';

abstract class CartRepository {
  Future<List<CartModel>> getCartItems();
  Future<String> addCartItem(CartModel product);
  Future<String> deleteCartItems(List<CartModel> cart);
  Future<String> updateCartItem(
      {required List<CartModel> cart,
      required CartModel product,
      required double quantity,
      required String unit});
}
