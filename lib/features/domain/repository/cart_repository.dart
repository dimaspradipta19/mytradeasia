import 'package:mytradeasia/features/data/model/cart_models/cart_models.dart';

abstract class CartRepository {
  Future<List<CartModel>> getCartItems();
}
