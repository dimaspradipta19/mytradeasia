import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class CartFirebase {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<List> getCart() async {
    final Map<String, dynamic> firestoreData = await FirebaseFirestore.instance
        .collection('biodata')
        .doc(_auth.currentUser?.uid.toString())
        .get()
        .then((DocumentSnapshot doc) {
      return doc.data() as Map<String, dynamic>;
    });

    List<dynamic> cartData = [];
    if (firestoreData['cart'] != null) {
      cartData = firestoreData['cart'];
    }
    for (var item in cartData) {
      item['isChecked'] = false;
    }

    return cartData;
  }
}
