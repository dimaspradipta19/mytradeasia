import 'package:mytradeasia/features/domain/entities/search_product_entities/search_product_entity.dart';

class SearchProductModel extends SearchProductEntity {
  const SearchProductModel({
    String? productname,
    String? productimage,
    String? hsCode,
    String? casNumber,
    String? seoUrl,
  }) : super(
          productname: productname,
          productimage: productimage,
          hsCode: hsCode,
          casNumber: casNumber,
          seoUrl: seoUrl,
        );

  factory SearchProductModel.fromJson(Map<String, dynamic> json) =>
      SearchProductModel(
        productname: json["productname"],
        productimage: json["productimage"],
        hsCode: json["hs_code"],
        casNumber: json["cas_number"],
        seoUrl: json["seo_url"] ?? "",
      );
}
