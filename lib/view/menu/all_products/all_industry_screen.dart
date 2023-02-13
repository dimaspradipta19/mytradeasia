import 'package:flutter/material.dart';
import 'package:mytradeasia/utils/theme.dart';

class AllIndustryScreen extends StatelessWidget {
  const AllIndustryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Image.asset(
            "assets/images/icon_back.png",
            width: 24.0,
            height: 24.0,
          ),
        ),
        title: const Text(
          "All Industries",
          style: heading2,
        ),
        centerTitle: true,
        backgroundColor: whiteColor,
        elevation: 0.0,
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: const [
            Text("All Industry Screen"),
          ],
        ),
      ),
    );
  }
}
