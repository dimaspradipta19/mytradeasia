import 'package:mytradeasia/features/domain/entities/detail_product_entities/detail_product_entities.dart';

class DetailsProductModel extends DetailsProductEntity {
  const DetailsProductModel({
    DetailProductModel? detailProduct,
    List<ListIndustryModel>? listIndustry,
    List<ListCategoryModel>? listCategory,
    List<RelatedProductModel>? relatedProducts,
  }) : super(
          detailProduct: detailProduct,
          listIndustry: listIndustry,
          listCategory: listCategory,
          relatedProducts: relatedProducts,
        );

  factory DetailsProductModel.fromJson(Map<String, dynamic> json) =>
      DetailsProductModel(
        // detailProduct: DetailProduct.fromJson(json["detail_product"]),
        detailProduct: json["detail_product"] != null
            ? DetailProductModel.fromJson(json["detail_product"])
            : null,
        listIndustry: List<ListIndustryModel>.from(
            json["list-industry"].map((x) => ListIndustryModel.fromJson(x))),
        listCategory: List<ListCategoryModel>.from(
            json["list-category"].map((x) => ListCategoryModel.fromJson(x))),
        relatedProducts: List<RelatedProductModel>.from(json["related-products"]
            .map((x) => RelatedProductModel.fromJson(x))),
      );
}

class DetailProductModel extends DetailProduct {
  const DetailProductModel({
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

  factory DetailProductModel.fromJson(Map<String, dynamic> json) =>
      DetailProductModel(
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

class ListCategoryModel extends ListCategory {
  const ListCategoryModel({
    String? categoryUrl,
    String? categoryName,
  }) : super(categoryName: categoryName, categoryUrl: categoryUrl);

  factory ListCategoryModel.fromJson(Map<String, dynamic> json) =>
      ListCategoryModel(
        categoryUrl: json["category_url"],
        categoryName: json["category_name"],
      );
}

class ListIndustryModel extends ListIndustry {
  const ListIndustryModel({
    String? industryUrl,
    String? industryName,
  }) : super(
          industryUrl: industryUrl,
          industryName: industryName,
        );

  factory ListIndustryModel.fromJson(Map<String, dynamic> json) =>
      ListIndustryModel(
        industryUrl: json["industry_url"],
        industryName: json["industry_name"],
      );
}

class RelatedProductModel extends RelatedProduct {
  const RelatedProductModel({
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

  factory RelatedProductModel.fromJson(Map<String, dynamic> json) =>
      RelatedProductModel(
        productname: json["productname"],
        productimage: json["productimage"],
        casNumber: json["cas_number"],
        hsCode: json["hs_code"],
        seoUrl: json["seo_url"],
      );
}
