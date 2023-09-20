import 'package:mytradeasia/features/data/model/cart_models/cart_models.dart';
import 'package:mytradeasia/features/domain/entities/product_entities/all_product_entity.dart';

abstract class CartEvent {
  const CartEvent();
}

class AddToCart extends CartEvent {
  final CartModel product;

  const AddToCart(this.product);
}

class RemoveFromCart extends CartEvent {
  final AllProductEntities product;

  const RemoveFromCart(this.product);
}

class GetCartItems extends CartEvent {
  const GetCartItems();
}
