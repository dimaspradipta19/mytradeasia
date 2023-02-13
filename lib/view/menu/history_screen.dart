import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../modelview/provider/db_manager.dart';
import '../../utils/result_state.dart';
import '../../utils/theme.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final FirebaseAuth _auth = FirebaseAuth.instance;

    final DbManager manager = DbManager();

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text("History Screen"),
          ),
          Consumer<DbManager>(
            builder: (context, DbManager value, _) {
              if (value.state == ResultState.loading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (value.state == ResultState.hasData) {
                return FutureBuilder(
                  future: value.getBiodataByUid(_auth.currentUser!.uid),
                  builder: (context, snapshot) {
                    return Column(
                      children: [
                        Text(
                            "UID : ${snapshot.data?.uid.toString() ?? "Kosong"}"),
                        Text(
                            "Firstname : ${snapshot.data?.firstName ?? "Kosong"}"),
                        Text(
                            "Lastname : ${snapshot.data?.lastName ?? "Kosong"}"),
                        Text(
                            "Companyname : ${snapshot.data?.companyName ?? "Kosong"}"),
                      ],
                    );
                  },
                );
              }
              return Container(
                color: secondaryColor1,
                child: const Text("Error"),
              );
            },
          ),
        ],
      ),
    );
  }
}
