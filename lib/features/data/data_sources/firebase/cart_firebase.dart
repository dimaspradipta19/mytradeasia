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

    if (firestoreData['cart'] != null) {
      List<dynamic> cartData = firestoreData['cart'];
      for (var item in cartData) {
        item['isChecked'] = false;
        final cartItem = CartModel.fromJson(item);
        data.add(cartItem);
      }
    }

    return data;
  }

  Future<String> addCartItem(CartModel product) async {
    try {
      String docsId = _auth.currentUser!.uid.toString();
      await FirebaseFirestore.instance
          .collection('biodata')
          .doc(docsId)
          .update({
        "cart": FieldValue.arrayUnion([product.toFirebase()])
      });
      return "success";
    } catch (e) {
      return e.toString();
    }
  }

  Future<String> deleteCartItems(List<CartModel> cart) async {
    try {
      // Get all selected items
      final List<CartModel> deletedData = [];
      for (var item in cart) {
        if (item.isChecked!) {
          CartModel data = CartModel(
              productName: item.productName,
              seoUrl: item.seoUrl,
              casNumber: item.casNumber,
              hsCode: item.hsCode,
              productImage: item.productImage,
              quantity: item.quantity,
              unit: item.unit);
          deletedData.add(data);
        }
      }

      if (deletedData.isEmpty) {
        // if no items are selected, do nothing
        return "none";
      } else {
        // Delete items from firestore
        String docsId = _auth.currentUser!.uid.toString();
        for (var item in deletedData) {
          await FirebaseFirestore.instance
              .collection('biodata')
              .doc(docsId)
              .update({
            "cart": FieldValue.arrayRemove([item.toFirebase()])
          });
        }
      }
      return "success";
    } catch (e) {
      return e.toString();
    }
  }

  Future<String> updateCartItem(
      {required List<CartModel> cart,
      required CartModel product,
      required double quantity,
      required String unit}) async {
    try {
      String docsId = _auth.currentUser!.uid.toString();

      CartModel data = CartModel(
          productName: product.productName,
          seoUrl: product.seoUrl,
          casNumber: product.casNumber,
          hsCode: product.hsCode,
          productImage: product.productImage,
          quantity: quantity,
          unit: unit);

      // Find the index of the updated data
      int updatedDataIdx =
          cart.indexWhere((product) => product.productName == data.productName);

      // Update the cart
      cart[updatedDataIdx] = data;

      // Convert to firebase data
      List<dynamic> firebaseData = [];
      for (var item in cart) {
        firebaseData.add(item.toFirebase());
      }

      // Send the newly updated cart data to firestore
      await FirebaseFirestore.instance
          .collection('biodata')
          .doc(docsId)
          .update({"cart": firebaseData});
      return "success";
    } catch (e) {
      return e.toString();
    }
  }
}
