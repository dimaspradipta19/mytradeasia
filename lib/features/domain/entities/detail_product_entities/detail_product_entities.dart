import 'package:equatable/equatable.dart';

class DetailsProductEntity extends Equatable {
  const DetailsProductEntity({
    required this.detailProduct,
    required this.listIndustry,
    required this.listCategory,
    required this.relatedProducts,
  });

  final DetailProduct? detailProduct;
  final List<ListIndustry>? listIndustry;
  final List<ListCategory>? listCategory;
  final List<RelatedProduct>? relatedProducts;

  @override
  List<Object?> get props {
    return [
      this.detailProduct,
      this.listIndustry,
      this.listCategory,
      this.relatedProducts,
    ];
  }
}

class DetailProduct {
  const DetailProduct({
    required this.productname,
    required this.productimage,
    required this.iupacName,
    required this.casNumber,
    required this.hsCode,
    required this.formula,
    required this.description,
    required this.application,
    required this.packagingName,
  });

  final String? productname;
  final String? productimage;
  final String? iupacName;
  final String? casNumber;
  final String? hsCode;
  final String? formula;
  final String? description;
  final String? application;
  final String? packagingName;
}

class ListCategory {
  const ListCategory({
    required this.categoryUrl,
    required this.categoryName,
  });

  final String? categoryUrl;
  final String? categoryName;
}

class ListIndustry {
  const ListIndustry({
    required this.industryUrl,
    required this.industryName,
  });

  final String? industryUrl;
  final String? industryName;
}

class RelatedProduct {
  const RelatedProduct({
    required this.productname,
    required this.productimage,
    required this.casNumber,
    required this.hsCode,
    required this.seoUrl,
  });

  final String? productname;
  final String? productimage;
  final String? casNumber;
  final String? hsCode;
  final String? seoUrl;
}
