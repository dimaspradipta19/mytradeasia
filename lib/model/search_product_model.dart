class SearchProductModel {
    SearchProductModel({
        required this.productname,
        required this.productimage,
        required this.hsCode,
        required this.casNumber,
        required this.seoUrl,
    });

    String productname;
    String productimage;
    String hsCode;
    String casNumber;
    String? seoUrl;

    factory SearchProductModel.fromJson(Map<String, dynamic> json) => SearchProductModel(
        productname: json["productname"],
        productimage: json["productimage"],
        hsCode: json["hs_code"],
        casNumber: json["cas_number"],
        seoUrl: json["seo_url"] ?? "",
    );

    Map<String, dynamic> toJson() => {
        "productname": productname,
        "productimage": productimage,
        "hs_code": hsCode,
        "cas_number": casNumber,
        "seo_url": seoUrl,
    };
}
