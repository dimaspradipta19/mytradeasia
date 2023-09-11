import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mytradeasia/features/presentation/state_management/cart_bloc/cart_event.dart';
import 'package:mytradeasia/features/presentation/state_management/cart_bloc/cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  // final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  CartBloc() : super(const CartLoadingState()) {
    on<GetCartItems>(onGetCartItems);
  }

  void onGetCartItems(GetCartItems event, Emitter<CartState> emit) async {
    try {
      final Map<String, dynamic> firestoreData = await FirebaseFirestore
          .instance
          .collection('biodata')
          .doc(_auth.currentUser?.uid.toString())
          .get()
          .then((DocumentSnapshot doc) {
        return doc.data() as Map<String, dynamic>;
      });

      final List<dynamic> cartData = firestoreData['cart'];
      for (var item in cartData) {
        item['isChecked'] = false;
      }
      log("CART DATA : $cartData");

      emit(CartDoneState(cartData));
    } on FirebaseException catch (e) {
      emit(CartErrorState(e));
    }
  }
}
