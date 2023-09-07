import 'package:mytradeasia/features/domain/entities/detail_product_entities/detail_product_entities.dart';

class DetailsProductModel extends DetailsProductEntity {
  const DetailsProductModel({
    _DetailProduct? detailProduct,
    List<_ListIndustryModel>? listIndustry,
    List<_ListCategoryModel>? listCategory,
    List<_RelatedProductModel>? relatedProducts,
  }) : super(
          detailProduct: detailProduct,
          listIndustry: listIndustry,
          listCategory: listCategory,
          relatedProducts: relatedProducts,
        );

  factory DetailsProductModel.fromJson(Map<String, dynamic> json) =>
      DetailsProductModel(
        // detailProduct: DetailProduct.fromJson(json["detail_product"]),
        detailProduct: _DetailProduct.fromJson(json["detail_product"]),
        listIndustry: List<_ListIndustryModel>.from(
            json["list-industry"].map((x) => _ListIndustryModel.fromJson(x))),
        listCategory: List<_ListCategoryModel>.from(
            json["list-category"].map((x) => _ListCategoryModel.fromJson(x))),
        relatedProducts: List<_RelatedProductModel>.from(
            json["related-products"]
                .map((x) => _RelatedProductModel.fromJson(x))),
      );
}

class _DetailProduct extends DetailProduct {
  const _DetailProduct({
    String? productname,
    String? productimage,
    String? iupacName,
    String? casNumber,
    String? hsCode,
    String? formula,
    String? description,
    String? application,
    String? packagingName,
  }) : super(
          productname: productname,
          productimage: productimage,
          iupacName: iupacName,
          casNumber: casNumber,
          hsCode: hsCode,
          formula: formula,
          description: description,
          application: application,
          packagingName: packagingName,
        );

  factory _DetailProduct.fromJson(Map<String, dynamic> json) => _DetailProduct(
        productname: json["productname"] ?? "",
        productimage: json["productimage"] ?? "",
        iupacName: json["iupac_name"] ?? "",
        casNumber: json["cas_number"] ?? "",
        hsCode: json["hs_code"] ?? "",
        formula: json["formula"] ?? "",
        description: json["description"] ?? "",
        application: json["application"] ?? "",
        packagingName: json["packaging_name"] ?? "",
      );
}

class _ListCategoryModel extends ListCategory {
  const _ListCategoryModel({
    String? categoryUrl,
    String? categoryName,
  }) : super(categoryName: categoryName, categoryUrl: categoryUrl);

  factory _ListCategoryModel.fromJson(Map<String, dynamic> json) =>
      _ListCategoryModel(
        categoryUrl: json["category_url"],
        categoryName: json["category_name"],
      );
}

class _ListIndustryModel extends ListIndustry {
  const _ListIndustryModel({
    String? industryUrl,
    String? industryName,
  }) : super(
          industryUrl: industryUrl,
          industryName: industryName,
        );

  factory _ListIndustryModel.fromJson(Map<String, dynamic> json) =>
      _ListIndustryModel(
        industryUrl: json["industry_url"],
        industryName: json["industry_name"],
      );
}

class _RelatedProductModel extends RelatedProduct {
  const _RelatedProductModel({
    String? productname,
    String? productimage,
    String? casNumber,
    String? hsCode,
    String? seoUrl,
  }) : super(
          productname: productname,
          productimage: productimage,
          casNumber: casNumber,
          hsCode: hsCode,
          seoUrl: seoUrl,
        );

  factory _RelatedProductModel.fromJson(Map<String, dynamic> json) =>
      _RelatedProductModel(
        productname: json["productname"],
        productimage: json["productimage"],
        casNumber: json["cas_number"],
        hsCode: json["hs_code"],
        seoUrl: json["seo_url"],
      );
}
