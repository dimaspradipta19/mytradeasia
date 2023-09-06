import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:getwidget/components/accordion/gf_accordion.dart';
// import 'package:mytradeasia/modelview/provider/faq_provider.dart';
import 'package:mytradeasia/core/constants/result_state.dart';
import 'package:mytradeasia/features/presentation/state_management/faq_bloc/faq_event.dart';
// import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../../../config/themes/theme.dart';
import '../../../../../state_management/faq_bloc/faq_bloc.dart';
import '../../../../../state_management/faq_bloc/faq_state.dart';

class FaqScreen extends StatefulWidget {
  const FaqScreen({super.key});

  @override
  State<FaqScreen> createState() => _FaqScreenState();
}

class _FaqScreenState extends State<FaqScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      var authBloc = BlocProvider.of<FaqBloc>(context);
      authBloc.add(const GetFaq());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: greyColor4,
      appBar: AppBar(
        title: const Text(
          "FAQ",
          style: heading2,
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Image.asset(
            "assets/images/icon_back.png",
            width: size20px + 4.0,
            height: size20px + 4.0,
          ),
        ),
        elevation: 0.0,
        backgroundColor: whiteColor,
      ),
      body: BlocBuilder<FaqBloc, FaqState>(
        builder: (context, state) {
          if (state is FaqLoading) {
            return Shimmer.fromColors(
                baseColor: greyColor3,
                highlightColor: greyColor,
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: 10,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) => Column(
                    children: const [
                      Padding(
                        padding: EdgeInsets.only(bottom: size20px / 2),
                        child: GFAccordion(),
                      ),
                    ],
                  ),
                ));
          } else if (state is FaqDone) {
            return ListView.builder(
              shrinkWrap: true,
              itemCount: state.faqData!.length,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) => Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: size20px / 2),
                    child: GFAccordion(
                      margin: EdgeInsets.zero,
                      titleChild: Padding(
                        padding:
                            const EdgeInsets.symmetric(horizontal: size20px),
                        child: Text(state.faqData![index].faqQuestion!,
                            style: body1Medium),
                      ),
                      contentChild: Padding(
                        padding:
                            const EdgeInsets.symmetric(horizontal: size20px),
                        child: Center(
                            child: Text(state.faqData![index].faqAnswer!)),
                      ),
                      collapsedIcon: Padding(
                        padding: const EdgeInsets.only(right: size20px),
                        child: Image.asset(
                          "assets/images/icon_bottom.png",
                          width: size20px + 4,
                          color: greyColor2,
                        ),
                      ),
                      expandedIcon: Padding(
                        padding: const EdgeInsets.only(right: size20px),
                        child: Image.asset("assets/images/icon_up.png",
                            width: size20px + 4, color: greyColor2),
                      ),
                      expandedTitleBackgroundColor: whiteColor,
                    ),
                  ),
                ],
              ),
            );
          } else {
            return const Center(child: Text("Error"));
          }
        },
      ),
    );
  }
}
