import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:mytradeasia/modelview/provider/sales_force_data_provider.dart';
import 'package:mytradeasia/utils/result_state.dart';
import 'package:mytradeasia/utils/theme.dart';
import 'package:provider/provider.dart';

// import '../modelview/provider/sales_force_login_provider.dart';

class SalesForceLoginScreen extends StatefulWidget {
  const SalesForceLoginScreen({super.key, required this.token});

  final String token;

  @override
  State<SalesForceLoginScreen> createState() => _SalesForceLoginScreenState();
}

class _SalesForceLoginScreenState extends State<SalesForceLoginScreen> {
  @override
  void initState() {
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
                    physics: const BouncingScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: valueData.salesforceDataModel!.records.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        trailing: const Icon(Icons.arrow_forward_ios_rounded),
                        onTap: () {
                          log(valueData.salesforceDataModel!.records[index].id);

                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) {
                              return DetailSalesforceDataScreen(
                                  idData: valueData
                                      .salesforceDataModel!.records[index].id);
                            },
                          ));
                        },
                        title: Text(
                            valueData.salesforceDataModel!.records[index].name),
                        subtitle: Text(
                            valueData.salesforceDataModel!.records[index].id),
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

class DetailSalesforceDataScreen extends StatelessWidget {
  const DetailSalesforceDataScreen({super.key, required this.idData});

  final String idData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0.5,
          title: Text(
            "Detail Salesforce Data",
            style: text20,
          )),
      body: Center(child: Text(idData)),
    );
  }
}
