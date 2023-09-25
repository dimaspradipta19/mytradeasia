import 'package:mytradeasia/features/domain/entities/rfq_entities/rfq_entity.dart';

class RfqModel extends RfqEntity {
  const RfqModel(
      {String? firstname,
      String? lastname,
      String? phone,
      String? country,
      String? company,
      List<RfqProductModel>? products,
      String? incoterm,
      String? portOfDestination,
      String? message})
      : super(
          firstname: firstname,
          lastname: lastname,
          phone: phone,
          country: country,
          company: company,
          products: products,
          incoterm: incoterm,
          portOfDestination: portOfDestination,
          message: message,
        );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['firstname'] = firstname;
    json['lastname'] = lastname;
    json['phone'] = phone;
    json['country'] = country;
    json['company'] = company;
    json['products'] = products;
    json['incoterm'] = incoterm;
    json['port_of_destination'] = portOfDestination;
    json['message'] = message;
    return json;
  }
}

class RfqProductModel extends RfqProduct {
  const RfqProductModel({
    String? productName,
    double? quantity,
    String? unit,
  }) : super(
          productName: productName,
          quantity: quantity,
          unit: unit,
        );
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['product_name'] = productName;
    json['quantity'] = quantity;
    json['unit'] = unit;
    return json;
  }
}
