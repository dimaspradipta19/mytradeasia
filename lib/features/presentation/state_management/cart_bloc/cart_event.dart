import 'package:mytradeasia/features/data/model/cart_models/cart_models.dart';

abstract class CartEvent {
  const CartEvent();
}

class AddToCart extends CartEvent {
  final CartModel product;

  const AddToCart(this.product);
}

class RemoveFromCart extends CartEvent {
  final List<CartModel> cart;

  const RemoveFromCart(this.cart);
}

class UpdateCartItem extends CartEvent {
  final List<CartModel> cart;
  final CartModel product;
  final double quantity;
  final String unit;

  const UpdateCartItem(this.cart, this.product, this.quantity, this.unit);
}

class GetCartItems extends CartEvent {
  const GetCartItems();
}
