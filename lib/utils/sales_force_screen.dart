import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mytradeasia/features/presentation/state_management/salesforce_bloc/salesforce_data/salesforce_data_bloc.dart';
import 'package:mytradeasia/features/presentation/state_management/salesforce_bloc/salesforce_data/salesforce_data_event.dart';
import 'package:mytradeasia/features/presentation/state_management/salesforce_bloc/salesforce_data/salesforce_data_state.dart';
import 'package:mytradeasia/features/presentation/state_management/salesforce_bloc/salesforce_detail/salesforce_detail_bloc.dart';
import 'package:mytradeasia/features/presentation/state_management/salesforce_bloc/salesforce_detail/salesforce_detail_event.dart';
import 'package:mytradeasia/features/presentation/state_management/salesforce_bloc/salesforce_detail/salesforce_detail_state.dart';
import 'package:mytradeasia/config/themes/theme.dart';

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
      // Provider.of<SalesforceDetailProvider>(context, listen: false)
      //     .getSalesforceDetail(widget.token, widget.urlDetail);
      BlocProvider.of<SalesforceDetailBloc>(context).add(GetDetailSalesforce(
          {"urlDetail": widget.urlDetail, "token": widget.token}));
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
        child: BlocBuilder<SalesforceDetailBloc, SalesforceDetailState>(
          builder: (context, state) {
            if (state is SalesforceDetailLoading) {
              return const CircularProgressIndicator.adaptive();
            }

            if (state is SalesforceDetailDone) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("ID : ${state.detailEntity!.id}"),
                  Text("Name : ${state.detailEntity!.name}"),
                  Text("Type : ${state.detailEntity!.type}"),
                  Text("Record Type ID : ${state.detailEntity!.recordTypeId}"),
                  Text("Billing Street : ${state.detailEntity!.billingStreet}"),
                  Text(
                      "Billing Country : ${state.detailEntity!.billingCountry}"),
                  Text(
                      "Currency Iso Code : ${state.detailEntity!.currencyIsoCode}"),
                  Text(
                      "Business Entity : ${state.detailEntity!.businessEntityC}"),
                  Text(
                      "Insurance Company Name : ${state.detailEntity!.insuranceCompanyNameC}"),
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
