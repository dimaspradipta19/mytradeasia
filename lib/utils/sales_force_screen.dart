import 'package:flutter/material.dart';
import 'package:mytradeasia/modelview/provider/sales_force_data_provider.dart';
import 'package:mytradeasia/utils/result_state.dart';
import 'package:mytradeasia/utils/theme.dart';
import 'package:provider/provider.dart';

import '../modelview/provider/sales_force_login_provider.dart';

class SalesForceLoginScreen extends StatefulWidget {
  const SalesForceLoginScreen({super.key, required this.token});

  final String token;

  @override
  State<SalesForceLoginScreen> createState() => _SalesForceLoginScreenState();
}

class _SalesForceLoginScreenState extends State<SalesForceLoginScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<SalesforceDataProvider>(context, listen: false)
          .getSampleData(widget.token);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: greyColor,
        title: const Text(
          "Appbar salesforce",
          style: TextStyle(
            color: blackColor,
          ),
        ),
      ),
      body: Column(
        children: [
          Consumer<SalesforceDataProvider>(
            builder: (context, valueData, child) {
              if (valueData.state == ResultState.loading) {
                return const Center(
                    child: CircularProgressIndicator.adaptive());
              }

              if (valueData.state == ResultState.hasData) {
                return Expanded(
                  child: ListView.builder(
                    itemCount: valueData.salesforceDataModel!.records.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(
                            valueData.salesforceDataModel!.records[index].name),
                        subtitle: Text(valueData
                            .salesforceDataModel!.records[index].phone),
                      );
                    },
                  ),
                );
              }

              if (valueData.state == ResultState.noData) {
                return const Text("No Data Found");
              }

              return const Text("Error screen");
            },
          ),
        ],
      ),
    );
  }
}