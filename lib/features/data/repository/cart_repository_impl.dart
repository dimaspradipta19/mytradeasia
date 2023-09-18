import 'package:mytradeasia/features/data/data_sources/firebase/cart_firebase.dart';
import 'package:mytradeasia/features/domain/repository/cart_repository.dart';

class CartRepositoryImpl implements CartRepository {
  final CartFirebase _cartFirebase;

  CartRepositoryImpl(this._cartFirebase);

  @override
  Future<List> getCart() async {
    final response = await _cartFirebase.getCart();
    return response;
  }
}
