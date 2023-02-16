import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../modelview/provider/db_manager.dart';
import '../../../utils/result_state.dart';
import '../../../utils/theme.dart';

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
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Center(
            child: Text("History Screen"),
          ),
          const Text("Get Data"),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 200,
            child: StreamBuilder(
              stream: _firestore
                  .collection('biodata')
                  .where('uid', isEqualTo: _auth.currentUser!.uid.toString())
                  .snapshots(),
              builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
                if (streamSnapshot.hasData) {
                  return ListView.builder(
                      itemCount: streamSnapshot.data!.docs.length,
                      itemBuilder: (ctx, index) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                                "First Name: ${streamSnapshot.data!.docs[index]['firstName']}"),
                            Text(
                                "Last Name: ${streamSnapshot.data!.docs[index]['lastName']}"),
                            Text(
                                "Company Name: ${streamSnapshot.data!.docs[index]['companyName']}"),
                            Text(
                                "Country: ${streamSnapshot.data!.docs[index]['country']}"),
                            Text(
                                "Password: ${streamSnapshot.data!.docs[index]['password']}"),
                            Text(
                                "UID: ${streamSnapshot.data!.docs[index]['uid']}"),
                          ],
                        );
                      });
                } else {
                  return const CircularProgressIndicator();
                }
              },
            ),
          )
        ],
      ),
    );
  }
}
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