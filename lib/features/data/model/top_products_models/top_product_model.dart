import 'package:mytradeasia/features/domain/entities/top_products_entities/top_products_entity.dart';

class TopProductsModel extends TopProductEntity {
  const TopProductsModel({
    String? productimage,
    String? productname,
    String? casNumber,
    String? hsCode,
    String? seoUrl,
    int? priority,
  }) : super(
          productimage: productimage,
          productname: productname,
          casNumber: casNumber,
          hsCode: hsCode,
          seoUrl: seoUrl,
          priority: priority,
        );

  factory TopProductsModel.fromJson(Map<String, dynamic> json) =>
      TopProductsModel(
        productimage: json["productimage"],
        productname: json["productname"],
        casNumber: json["cas_number"],
        hsCode: json["hs_code"],
        seoUrl: json["seo_url"],
        priority: json["priority"],
      );
}
