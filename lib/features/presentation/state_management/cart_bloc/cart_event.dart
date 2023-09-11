import 'package:mytradeasia/features/domain/entities/product_entities/all_product_entity.dart';

abstract class CartEvent {}

class AddToCart extends CartEvent {
  final AllProductEntities product;

  AddToCart(this.product);
}

class RemoveFromCart extends CartEvent {
  final AllProductEntities product;

  RemoveFromCart(this.product);
}

class GetCartItems extends CartEvent {
  GetCartItems();
}
