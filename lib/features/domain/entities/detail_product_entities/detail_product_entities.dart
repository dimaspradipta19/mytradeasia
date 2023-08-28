import 'package:equatable/equatable.dart';

class DetailProductModel extends Equatable {
  DetailProductModel({
    required this.detailProduct,
    required this.listIndustry,
    required this.listCategory,
    required this.relatedProducts,
  });

  final DetailProduct? detailProduct;
  final List<ListIndustry> listIndustry;
  final List<ListCategory> listCategory;
  final List<RelatedProduct> relatedProducts;

  @override
  // TODO: implement props
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
  DetailProduct({
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

  String? productname;
  String? productimage;
  String? iupacName;
  String? casNumber;
  String? hsCode;
  String? formula;
  String? description;
  String? application;
  String? packagingName;
}

class ListCategory {
  ListCategory({
    required this.categoryUrl,
    required this.categoryName,
  });

  String categoryUrl;
  String categoryName;
}

class ListIndustry {
  ListIndustry({
    required this.industryUrl,
    required this.industryName,
  });

  String industryUrl;
  String industryName;
}

class RelatedProduct {
  RelatedProduct({
    required this.productname,
    required this.productimage,
    required this.casNumber,
    required this.hsCode,
    required this.seoUrl,
  });

  String productname;
  String productimage;
  String casNumber;
  String hsCode;
  String seoUrl;
}
