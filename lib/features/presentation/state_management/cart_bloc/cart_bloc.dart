import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mytradeasia/features/domain/usecases/cart_usecases/add_cart.dart';
import 'package:mytradeasia/features/domain/usecases/cart_usecases/get_cart.dart';
import 'package:mytradeasia/features/presentation/state_management/cart_bloc/cart_event.dart';
import 'package:mytradeasia/features/presentation/state_management/cart_bloc/cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final GetCart _getCart;
  final AddCart _addCart;

  CartBloc(this._getCart, this._addCart) : super(const CartLoadingState()) {
    on<GetCartItems>(onGetCartItems);
    on<AddToCart>(onAddCartItem);
  }

  void onGetCartItems(GetCartItems event, Emitter<CartState> emit) async {
    try {
      final data = await _getCart();
      log("DATA CART : $data");
      emit(CartDoneState(cartItems: data));
    } on FirebaseException catch (e) {
      emit(CartErrorState(e));
    }
  }

  void onAddCartItem(AddToCart event, Emitter<CartState> emit) async {
    try {
      final data = await _addCart(param: event.product);
      emit(CartDoneState(addCartStatus: data, cartItems: state.cartItems));
    } on FirebaseException catch (e) {
      emit(CartErrorState(e));
    }
  }
}
