import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mytradeasia/features/domain/usecases/cart_usecase/get_cart.dart';
import 'package:mytradeasia/features/presentation/state_management/cart_bloc/cart_event.dart';
import 'package:mytradeasia/features/presentation/state_management/cart_bloc/cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final GetCart _getCart;

  CartBloc(this._getCart) : super(const CartLoadingState()) {
    on<GetCartItems>(onGetCartItems);
  }

  void onGetCartItems(GetCartItems event, Emitter<CartState> emit) async {
    try {
      final data = await _getCart();
      log("DATA CART : $data");
      emit(CartDoneState(data));
    } on FirebaseException catch (e) {
      emit(CartErrorState(e));
    }
  }
}
