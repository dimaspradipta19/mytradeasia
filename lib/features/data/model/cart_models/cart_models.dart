import 'package:mytradeasia/features/domain/entities/cart_entities/cart_entities.dart';

class CartModel extends CartEntity {
  const CartModel({
    String? productName,
    String? productImage,
    String? hsCode,
    String? casNumber,
    String? seoUrl,
    String? unit,
    double? quantity,
  }) : super(
            productName: productName,
            productImage: productImage,
            hsCode: hsCode,
            casNumber: casNumber,
            seoUrl: seoUrl,
            unit: unit,
            quantity: quantity);

  Map<String, dynamic> toMap() {
    return {
      'productname': productName,
      'productimage': productImage,
      'hsCode': hsCode,
      'casNumber': casNumber,
      'seo_url': seoUrl,
      'unit': unit,
      'quantity': quantity
    };
  }
}
