import 'package:mytradeasia/features/data/data_sources/firebase/cart_firebase.dart';
import 'package:mytradeasia/features/data/model/cart_models/cart_models.dart';
import 'package:mytradeasia/features/domain/repository/cart_repository.dart';

class CartRepositoryImpl implements CartRepository {
  final CartFirebase _cartFirebase;

  CartRepositoryImpl(this._cartFirebase);

  @override
  Future<List<CartModel>> getCartItems() async {
    try {
      return await _cartFirebase.getCartItems();
    } catch (e) {
      return Future.error(e.toString());
    }
  }

  @override
  Future<String> addCartItem(CartModel product) async {
    try {
      return await _cartFirebase.addCartItem(product);
    } catch (e) {
      return Future.error(e.toString());
    }
  }
}
