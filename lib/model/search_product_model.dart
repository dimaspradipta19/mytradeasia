class SearchProductModel {
    SearchProductModel({
        required this.productname,
        required this.productimage,
    });

    String productname;
    String productimage;

    factory SearchProductModel.fromJson(Map<String, dynamic> json) => SearchProductModel(
        productname: json["productname"],
        productimage: json["productimage"],
    );

    Map<String, dynamic> toJson() => {
        "productname": productname,
        "productimage": productimage,
    };
}
