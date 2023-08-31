import 'package:flutter/material.dart';
import 'package:mytradeasia/utils/result_state.dart';
import 'package:mytradeasia/utils/theme.dart';
import 'package:provider/provider.dart';

import '../modelview/provider/searates_provider.dart';

class SearatesScreen extends StatefulWidget {
  const SearatesScreen({super.key});

  @override
  State<SearatesScreen> createState() => _SearatesScreenState();
}

class _SearatesScreenState extends State<SearatesScreen> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      // provider get data from searates
      Provider.of<SearatesProvider>(context, listen: false).getSearatesData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: whiteColor,
        title: const Text(
          "Searates",
          style: TextStyle(color: blackColor),
        ),
      ),
      body: Consumer<SearatesProvider>(
        builder: (context, value, child) {
          if (value.state == ResultState.loading) {
            return const CircularProgressIndicator.adaptive();
          }
          if (value.state == ResultState.hasData) {
            return Column(
              children: [
                Text(
                  value.resultShipmentSearates!.data.metadata.number,
                  style: const TextStyle(fontSize: 40, color: blackColor),
                ),
                Text(
                  value.resultShipmentSearates!.data.metadata.sealineName,
                  style: const TextStyle(fontSize: 40, color: blackColor),
                ),
                Text(
                  value.resultShipmentSearates!.data.metadata.status,
                  style: const TextStyle(fontSize: 40, color: blackColor),
                ),
                Text(
                  value.resultShipmentSearates!.data.metadata.apiCalls.total.toString(),
                  style: const TextStyle(fontSize: 40, color: blackColor),
                ),
              ],
            );
          }

          return Container();
        },
      ),
    );
  }
}
