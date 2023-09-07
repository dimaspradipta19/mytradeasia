import 'package:flutter/material.dart';
import 'package:mytradeasia/features/domain/entities/detail_product_entities/detail_product_entities.dart';

import '../../../../config/themes/theme.dart';
import '../../../../model/detail_product_model.dart';
import '../../../../modelview/provider/see_more_provider.dart';

Widget descriptionContent(DetailsProductEntity? snapshot, bool valueSeeMore,
    CallbackAction getExpand) {
  return IntrinsicHeight(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: size20px),
            child: Text(
              snapshot!.detailProduct?.description ?? "N/A",
              style: body1Regular,
              maxLines: valueSeeMore ? null : 5,
            ),
          ),
        ),
        InkWell(
          onTap: () {
            getExpand;
          },
          child: Center(
            child: Text(
              valueSeeMore ? "Show Less" : "See More",
              style: body1Regular.copyWith(color: secondaryColor1),
            ),
          ),
        ),
      ],
    ),
  );
}
