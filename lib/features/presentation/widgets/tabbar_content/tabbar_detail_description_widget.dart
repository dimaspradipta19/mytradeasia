import 'package:flutter/material.dart';

import '../../../../config/themes/theme.dart';
import '../../../../model/detail_product_model.dart';
import '../../../../modelview/provider/see_more_provider.dart';

Widget descriptionContent(
    AsyncSnapshot<DetailProductModel?> snapshot, SeeMoreProvider valueSeeMore) {
  return IntrinsicHeight(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: size20px),
            child: Text(
              snapshot.data?.detailProduct?.description ?? "N/A",
              style: body1Regular,
              maxLines: valueSeeMore.isExpand ? null : 5,
            ),
          ),
        ),
        InkWell(
          onTap: () {
            valueSeeMore.getExpand();
          },
          child: Center(
            child: Text(
              valueSeeMore.isExpand ? "Show Less" : "See More",
              style: body1Regular.copyWith(color: secondaryColor1),
            ),
          ),
        ),
      ],
    ),
  );
}
