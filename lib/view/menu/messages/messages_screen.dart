import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MessageScreen extends StatefulWidget {
  const MessageScreen({super.key});

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

final FirebaseAuth _auth = FirebaseAuth.instance;
final FirebaseFirestore _firestore = FirebaseFirestore.instance;

class _MessageScreenState extends State<MessageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
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
                        Text("UID: ${streamSnapshot.data!.docs[index]['uid']}"),
                      ],
                    );
                  });
            } else {
              return const CircularProgressIndicator();
            }
          },
        ),
      ),
    );
  }
}
