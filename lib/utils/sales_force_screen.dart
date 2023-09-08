import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mytradeasia/features/presentation/state_management/salesforce_bloc/salesforce_data/salesforce_data_bloc.dart';
import 'package:mytradeasia/features/presentation/state_management/salesforce_bloc/salesforce_data/salesforce_data_event.dart';
import 'package:mytradeasia/features/presentation/state_management/salesforce_bloc/salesforce_data/salesforce_data_state.dart';
// import 'package:mytradeasia/modelview/provider/sales_force_data_provider.dart';
import 'package:mytradeasia/modelview/provider/sales_force_detail_provider.dart';
import 'package:mytradeasia/core/constants/result_state.dart';
import 'package:mytradeasia/config/themes/theme.dart';
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
      var salesForceDataBloc = BlocProvider.of<SalesforceDataBloc>(context);
      salesForceDataBloc.add(GetDataSalesforce(widget.token));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: greyColor,
        title: const Text(
          "Data Perusahaan di salesforce",
          style: TextStyle(
            color: blackColor,
          ),
        ),
      ),
      body: Column(
        children: [
          BlocBuilder<SalesforceDataBloc, SalesforceDataState>(
            builder: (context, state) {
              if (state is SalesforceDataLoading) {
                return const Expanded(
                  child: Center(child: CircularProgressIndicator.adaptive()),
                );
              }

              if (state is SalesforceDataDone && state.dataEntity != null) {
                return Expanded(
                  child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: state.dataEntity!.records!.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        trailing: const Icon(Icons.arrow_forward_ios_rounded),
                        onTap: () {
                          log(state.dataEntity!.records![index].id!);

                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) {
                              return DetailSalesforceDataScreen(
                                urlDetail: state.dataEntity!.records![index]
                                    .attributes!.url!,
                                token: widget.token,
                              );
                            },
                          ));
                        },
                        title: Text(state.dataEntity!.records![index].name!),
                        subtitle: Text(state.dataEntity!.records![index].id!),
                      );
                    },
                  ),
                );
              }

              if (state is SalesforceDataDone && state.dataEntity == null) {
                return const Text("No Data Found");
              }

              return const Text("Error screen");
            },
          )
        ],
      ),
    );
  }
}

class DetailSalesforceDataScreen extends StatefulWidget {
  const DetailSalesforceDataScreen(
      {super.key, required this.urlDetail, required this.token});

  final String urlDetail;
  final String token;

  @override
  State<DetailSalesforceDataScreen> createState() =>
      _DetailSalesforceDataScreenState();
}

class _DetailSalesforceDataScreenState
    extends State<DetailSalesforceDataScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsFlutterBinding.ensureInitialized().addPostFrameCallback((timeStamp) {
      Provider.of<SalesforceDetailProvider>(context, listen: false)
          .getSalesforceDetail(widget.token, widget.urlDetail);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: greyColor,
          elevation: 0.5,
          title: const Text(
            "Detail Salesforce Data",
            style: text20,
          )),
      body: Center(
        child: Consumer<SalesforceDetailProvider>(
          builder: (context, valueSalesforceDetail, child) {
            if (valueSalesforceDetail.state == ResultState.loading) {
              return const CircularProgressIndicator.adaptive();
            }

            if (valueSalesforceDetail.state == ResultState.hasData) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("ID : ${valueSalesforceDetail.result!.id}"),
                  Text("Name : ${valueSalesforceDetail.result!.name}"),
                  Text("Type : ${valueSalesforceDetail.result!.type}"),
                  Text(
                      "Record Type ID : ${valueSalesforceDetail.result!.recordTypeId}"),
                  Text(
                      "Billing Street : ${valueSalesforceDetail.result!.billingStreet}"),
                  Text(
                      "Billing Country : ${valueSalesforceDetail.result!.billingCountry}"),
                  Text(
                      "Currency Iso Code : ${valueSalesforceDetail.result!.currencyIsoCode}"),
                  Text(
                      "Business Entity : ${valueSalesforceDetail.result!.businessEntityC}"),
                  Text(
                      "Insurance Company Name : ${valueSalesforceDetail.result!.insuranceCompanyNameC}"),
                ],
              );
            }

            return const Text("Error");
          },
        ),
      ),
    );
  }
}
