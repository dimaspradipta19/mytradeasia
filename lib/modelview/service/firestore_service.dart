// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';

// class FirestoreService {
//   final auth = FirebaseAuth.instance;

//   Future<String> addData(
//     String firstName,
//     String lastName,
//     String companyName,
//     String country,
//     String password,
//     String uid,
//   ) async {
//     try {
//       CollectionReference biodata =
//           FirebaseFirestore.instance.collection('biodata');
//       // Call the user's CollectionReference to add a new user
//       await biodata.doc(auth.currentUser!.uid.toString()).set({
//         'firstName': firstName,
//         'lastName': lastName,
//         'companyName': companyName,
//         'country': country,
//         'password': password,
//         'uid': uid,
//       });
//       return 'success';
//     } catch (e) {
//       throw Exception(e.toString());
//     }
//   }

//   Future<String?> getData(String uid) async {
//     try {
//       CollectionReference users =
//           FirebaseFirestore.instance.collection('biodata');
//       final snapshot = await users.doc(auth.currentUser!.uid.toString()).get();
//       final data = snapshot.data() as Map<String, dynamic>;
//       return data['firstName'];
//     } catch (e) {
//       return 'Error fetching user';
//     }
//   }
// }
