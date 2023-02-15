import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mytradeasia/modelview/service/firestore_service.dart';
import 'package:provider/provider.dart';

import '../../modelview/provider/db_manager.dart';
import '../../utils/result_state.dart';
import '../../utils/theme.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    // final DbManager manager = DbManager();

    // final DocumentReference documentReference = FirebaseFirestore.instance
    //     .collection('biodata')
    //     .doc(_auth.currentUser!.uid.toString());

    // final DocumentSnapshot documentSnapshot = await FirebaseFirestore.instance
    //     .collection('biodata')
    //     .doc(_auth.currentUser!.uid.toString()).get();
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Center(
            child: Text("History Screen"),
          ),
          ElevatedButton(
            onPressed: () async {
              DocumentSnapshot snapshot = await FirebaseFirestore.instance
                  .collection('biodata')
                  .doc(_auth.currentUser!.uid.toString())
                  .get();
              if (snapshot.exists) {
                print("FirstName :${snapshot.get("firstName")}");
                print("LastName :${snapshot.get("lastName")}");
                print("CompanyName ${snapshot.get("companyName")}");
                print("Country :${snapshot.get("country")}");
                print("Password :${snapshot.get("password")}");
                print("UID :${snapshot.get("uid")}");
              } else {
                print('Document does not exist');
              }
            },
            child: const Text("Get Data"),
          ),
          // Consumer<DbManager>(
          //   builder: (context, DbManager value, _) {
          //     if (value.state == ResultState.loading) {
          //       return const Center(
          //         child: CircularProgressIndicator(),
          //       );
          //     } else if (value.state == ResultState.hasData) {
          //       return FutureBuilder(
          //         future: value.getBiodataByUid(_auth.currentUser!.uid),
          //         builder: (context, snapshot) {
          //           return Column(
          //             children: [
          //               Text(
          //                   "UID : ${snapshot.data?.uid.toString() ?? "Kosong"}"),
          //               Text(
          //                   "Firstname : ${snapshot.data?.firstName ?? "Kosong"}"),
          //               Text(
          //                   "Lastname : ${snapshot.data?.lastName ?? "Kosong"}"),
          //               Text(
          //                   "Companyname : ${snapshot.data?.companyName ?? "Kosong"}"),
          //             ],
          //           );
          //         },
          //       );
          //     }
          //     return Container(
          //       color: secondaryColor1,
          //       child: const Text("Error"),
          //     );
          //   },
          // ),
        ],
      ),
    );
  }
}
