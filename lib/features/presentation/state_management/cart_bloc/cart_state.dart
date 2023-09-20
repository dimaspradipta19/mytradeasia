import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:mytradeasia/features/data/model/cart_models/cart_models.dart';

class CartState extends Equatable {
  final List<CartModel>? cartItems;
  final FirebaseException? error;

  const CartState({this.cartItems, this.error});

  @override
  List<Object?> get props => [cartItems, error];
}

class CartLoadingState extends CartState {
  const CartLoadingState();
}

class CartDoneState extends CartState {
  const CartDoneState(
      {List<CartModel>? cartItems,
      String? addCartStatus,
      String? deleteItemStatus})
      : super(cartItems: cartItems);
}

class CartErrorState extends CartState {
  const CartErrorState(FirebaseException error) : super(error: error);
}
