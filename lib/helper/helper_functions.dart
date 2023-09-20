import 'package:mytradeasia/features/data/model/cart_models/cart_models.dart';
import 'package:mytradeasia/features/domain/entities/product_entities/product_entity.dart';

dynamic parseDoubleToIntegerIfNecessary(double input) {
  String inputString = input.toString();

  // Check if the input string ends with ".0"
  if (inputString.endsWith('.0')) {
    return int.parse(inputString.split('.').first);
  } else {
    return input;
  }
}

CartModel castProductEntityToCartModel(
    {required ProductEntity product,
    required double quantity,
    required String unit}) {
  return CartModel(
      productName: product.productname,
      productImage: product.productimage,
      hsCode: product.hsCode,
      casNumber: product.casNumber,
      seoUrl: product.seoUrl,
      quantity: quantity,
      unit: unit);
}
