import 'package:flutter/material.dart';
import 'package:mytradeasia/widget/text_editing_widget.dart';

import '../../../utils/theme.dart';

class LanguagesScreen extends StatefulWidget {
  const LanguagesScreen({super.key});

  @override
  State<LanguagesScreen> createState() => _LanguagesScreenState();
}

final _searchController = TextEditingController();

class _LanguagesScreenState extends State<LanguagesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: greyColor4,
      appBar: AppBar(
        title: const Text(
          "Choose Country",
          style: heading2,
        ),
        centerTitle: true,
        elevation: 0.0,
        automaticallyImplyLeading: false,
        leading: IconButton(
          enableFeedback: false,
          icon: Image.asset(
            "assets/images/icon_back.png",
            width: size20px + 4.0,
            height: size20px + 4.0,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
                left: size20px,
                right: size20px,
                top: size20px / 2,
                bottom: size20px),
            child: TextEditingWithPrefixFilled(
              hintText: "Search",
              urlImage: "assets/images/icon_search.png",
              controller: _searchController,
              radiusBorder: 10.0,
            ),
          ),
          
        ],
      ),
    );
  }
}
