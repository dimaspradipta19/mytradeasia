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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['seo_url'] = this.seoUrl;
    data['unit'] = this.unit;
    data['quantity'] = this.quantity;
    data['productImage'] = this.productImage;
    data['hsCode'] = this.hsCode;
    data['casNumber'] = this.casNumber;
    data['productName'] = this.productName;
    data['isChecked'] = this.isChecked;
    return data;
  }

  Map<String, dynamic> toFirebase() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['seo_url'] = this.seoUrl;
    data['unit'] = this.unit;
    data['quantity'] = this.quantity;
    data['productImage'] = this.productImage;
    data['hsCode'] = this.hsCode;
    data['casNumber'] = this.casNumber;
    data['productName'] = this.productName;
    return data;
  }
}
