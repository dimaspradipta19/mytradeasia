class ProductToRfq {
  final String productName;
  final String productImage;
  final String hsCode;
  final String casNumber;
  double? quantity;
  String? unit;

  ProductToRfq(
      {required this.productName,
      required this.productImage,
      required this.hsCode,
      required this.casNumber,
      this.quantity,
      this.unit});
}
