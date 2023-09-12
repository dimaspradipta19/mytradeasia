import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:mytradeasia/features/domain/entities/product_entities/all_product_entity.dart';

class CartState extends Equatable {
  final List<dynamic>? cartItems;
  final FirebaseException? error;

  const CartState({this.cartItems, this.error});

  @override
  List<Object?> get props => [cartItems, error];
}

class CartLoadingState extends CartState {
  const CartLoadingState();
}

class CartDoneState extends CartState {
  const CartDoneState(List<dynamic>? cartItems) : super(cartItems: cartItems);
}

class CartErrorState extends CartState {
  const CartErrorState(FirebaseException error) : super(error: error);
}
