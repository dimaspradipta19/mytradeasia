import 'package:mytradeasia/features/domain/entities/product_entities/all_product_entity.dart';

class AllProductModel extends AllProductEntities {
  const AllProductModel({
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

  factory AllProductModel.fromJson(Map<String, dynamic> json) =>
      AllProductModel(
        productname: json["productname"],
        productimage: json["productimage"],
        hsCode: json["hs_code"],
        casNumber: json["cas_number"],
        seoUrl: json["seo_url"] ?? " ",
      );
}
