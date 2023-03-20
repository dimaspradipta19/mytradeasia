class DetailProductModel {
    DetailProductModel({
        required this.detailProduct,
        required this.listIndustry,
        required this.listCategory,
        required this.relatedProducts,
    });

    DetailProduct detailProduct;
    List<ListIndustry> listIndustry;
    List<ListCategory> listCategory;
    List<RelatedProduct> relatedProducts;

    factory DetailProductModel.fromJson(Map<String, dynamic> json) => DetailProductModel(
        detailProduct: DetailProduct.fromJson(json["detail_product"]),
        listIndustry: List<ListIndustry>.from(json["list-industry"].map((x) => ListIndustry.fromJson(x))),
        listCategory: List<ListCategory>.from(json["list-category"].map((x) => ListCategory.fromJson(x))),
        relatedProducts: List<RelatedProduct>.from(json["related-products"].map((x) => RelatedProduct.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "detail_product": detailProduct.toJson(),
        "list-industry": List<dynamic>.from(listIndustry.map((x) => x.toJson())),
        "list-category": List<dynamic>.from(listCategory.map((x) => x.toJson())),
        "related-products": List<dynamic>.from(relatedProducts.map((x) => x.toJson())),
    };
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

    String productname;
    String productimage;
    String iupacName;
    String casNumber;
    String hsCode;
    String formula;
    String description;
    String application;
    String packagingName;

    factory DetailProduct.fromJson(Map<String, dynamic> json) => DetailProduct(
        productname: json["productname"],
        productimage: json["productimage"],
        iupacName: json["iupac_name"],
        casNumber: json["cas_number"],
        hsCode: json["hs_code"],
        formula: json["formula"] ?? "",
        description: json["description"],
        application: json["application"],
        packagingName: json["packaging_name"],
    );

    Map<String, dynamic> toJson() => {
        "productname": productname,
        "productimage": productimage,
        "iupac_name": iupacName,
        "cas_number": casNumber,
        "hs_code": hsCode,
        "formula": formula,
        "description": description,
        "application": application,
        "packaging_name": packagingName,
    };
}

class ListCategory {
    ListCategory({
        required this.categoryUrl,
        required this.categoryName,
    });

    String categoryUrl;
    String categoryName;

    factory ListCategory.fromJson(Map<String, dynamic> json) => ListCategory(
        categoryUrl: json["category_url"],
        categoryName: json["category_name"],
    );

    Map<String, dynamic> toJson() => {
        "category_url": categoryUrl,
        "category_name": categoryName,
    };
}

class ListIndustry {
    ListIndustry({
        required this.industryUrl,
        required this.industryName,
    });

    String industryUrl;
    String industryName;

    factory ListIndustry.fromJson(Map<String, dynamic> json) => ListIndustry(
        industryUrl: json["industry_url"],
        industryName: json["industry_name"],
    );

    Map<String, dynamic> toJson() => {
        "industry_url": industryUrl,
        "industry_name": industryName,
    };
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

    factory RelatedProduct.fromJson(Map<String, dynamic> json) => RelatedProduct(
        productname: json["productname"],
        productimage: json["productimage"],
        casNumber: json["cas_number"],
        hsCode: json["hs_code"],
        seoUrl: json["seo_url"],
    );

    Map<String, dynamic> toJson() => {
        "productname": productname,
        "productimage": productimage,
        "cas_number": casNumber,
        "hs_code": hsCode,
        "seo_url": seoUrl,
    };
}
