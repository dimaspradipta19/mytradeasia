class TopProductsModel {
    TopProductsModel({
        required this.productimage,
        required this.productname,
        required this.productId,
        required this.seoUrl,
        required this.priority,
    });

    String productimage;
    String productname;
    int productId;
    String seoUrl;
    int priority;

    factory TopProductsModel.fromJson(Map<String, dynamic> json) => TopProductsModel(
        productimage: json["productimage"],
        productname: json["productname"],
        productId: json["product_id"],
        seoUrl: json["seo_url"],
        priority: json["priority"],
    );

    Map<String, dynamic> toJson() => {
        "productimage": productimage,
        "productname": productname,
        "product_id": productId,
        "seo_url": seoUrl,
        "priority": priority,
    };
}
