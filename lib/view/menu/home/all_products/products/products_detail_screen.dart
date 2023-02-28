import 'package:flutter/material.dart';
import 'package:mytradeasia/utils/theme.dart';

class ProductsDetailScreen extends StatelessWidget {
  const ProductsDetailScreen({super.key, required this.indexing});

  final int indexing;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              color: secondaryColor1,
              width: MediaQuery.of(context).size.width,
              height: size20px * 15.0,
            ),
            Text(indexing.toString()),
          ],
        ),
      ),
    );
  }
}
