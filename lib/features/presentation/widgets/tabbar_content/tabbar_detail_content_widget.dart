// import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mytradeasia/features/domain/entities/detail_product_entities/detail_product_entities.dart';

import '../../../../config/themes/theme.dart';

Widget applicationContent(
    DetailsProductEntity? snapshot, ValueNotifier<bool> valueSeeMore) {
  return ValueListenableBuilder<bool>(
      valueListenable: valueSeeMore,
      builder: (context, value, child) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: size20px),
                child: Text(
                  snapshot!.detailProduct?.application ?? "N/A",
                  style: body1Regular,
                  maxLines: valueSeeMore.value ? null : 5,
                ),
              ),
            ),
            InkWell(
              onTap: () {
                valueSeeMore.value = !valueSeeMore.value;
              },
              child: Center(
                child: Text(
                  valueSeeMore.value ? "Show Less" : "See More",
                  style: body1Regular.copyWith(color: secondaryColor1),
                ),
              ),
            ),
          ],
        );
      });
}
