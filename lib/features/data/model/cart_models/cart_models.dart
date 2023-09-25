class CartModel {
  String? seoUrl;
  String? unit;
  double? quantity;
  String? productImage;
  String? hsCode;
  String? casNumber;
  String? productName;
  bool? isChecked;

  CartModel(
      {this.seoUrl,
      this.unit,
      this.quantity,
      this.productImage,
      this.hsCode,
      this.casNumber,
      this.productName,
      this.isChecked});

  CartModel.fromJson(Map<String, dynamic> json) {
    seoUrl = json['seo_url'];
    unit = json['unit'];
    quantity = json['quantity'];
    productImage = json['productImage'];
    hsCode = json['hsCode'];
    casNumber = json['casNumber'];
    productName = json['productName'];
    isChecked = json['isChecked'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['seo_url'] = seoUrl;
    data['unit'] = unit;
    data['quantity'] = quantity;
    data['productImage'] = productImage;
    data['hsCode'] = hsCode;
    data['casNumber'] = casNumber;
    data['productName'] = productName;
    data['isChecked'] = isChecked;
    return data;
  }

  Map<String, dynamic> toFirebase() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['seo_url'] = seoUrl;
    data['unit'] = unit;
    data['quantity'] = quantity;
    data['productImage'] = productImage;
    data['hsCode'] = hsCode;
    data['casNumber'] = casNumber;
    data['productName'] = productName;
    return data;
  }
}
