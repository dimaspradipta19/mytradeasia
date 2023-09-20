import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mytradeasia/features/data/model/cart_models/cart_models.dart';

class CartFirebase {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<List<CartModel>> getCartItems() async {
    final Map<String, dynamic> firestoreData = await FirebaseFirestore.instance
        .collection('biodata')
        .doc(_auth.currentUser?.uid.toString())
        .get()
        .then((DocumentSnapshot doc) {
      return doc.data() as Map<String, dynamic>;
    });

    List<CartModel> data = [];

    List<dynamic> cartData = [];
    if (firestoreData['cart'] != null) {
      cartData = firestoreData['cart'];
      for (var item in cartData) {
        item['isChecked'] = false;
        final cartItem = CartModel.fromJson(item);
        data.add(cartItem);
      }
    }

    return data;
  }
}
