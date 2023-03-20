class TopProductsModel {
  TopProductsModel({
    required this.productimage,
    required this.productname,
    required this.casNumber,
    required this.hsCode,
    required this.seoUrl,
    required this.priority,
  });

  String productimage;
  String productname;
  String casNumber;
  String hsCode;
  String seoUrl;
  int priority;

  factory TopProductsModel.fromJson(Map<String, dynamic> json) =>
      TopProductsModel(
        productimage: json["productimage"],
        productname: json["productname"],
        casNumber: json["cas_number"],
        hsCode: json["hs_code"],
        seoUrl: json["seo_url"],
        priority: json["priority"],
      );

  Map<String, dynamic> toJson() => {
        "productimage": productimage,
        "productname": productname,
        "cas_number": casNumber,
        "hs_code": hsCode,
        "seo_url": seoUrl,
        "priority": priority,
      };
}
