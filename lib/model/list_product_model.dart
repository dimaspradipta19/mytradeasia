class ListProductModel {
    ListProductModel({
        required this.productname,
        required this.productimage,
    });

    String productname;
    String productimage;

    factory ListProductModel.fromJson(Map<String, dynamic> json) => ListProductModel(
        productname: json["productname"],
        productimage: json["productimage"],
    );

    Map<String, dynamic> toJson() => {
        "productname": productname,
        "productimage": productimage,
    };
}
