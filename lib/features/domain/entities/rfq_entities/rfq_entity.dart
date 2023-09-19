import 'package:equatable/equatable.dart';

class RfqEntity extends Equatable {
  final String? firstname;
  final String? lastname;
  final String? phone;
  final String? country;
  final String? company;
  final List<RfqProduct>? products;
  final String? incoterm;
  final String? portOfDestination;
  final String? message;

  const RfqEntity({
    this.firstname,
    this.lastname,
    this.phone,
    this.country,
    this.company,
    this.products,
    this.incoterm,
    this.portOfDestination,
    this.message,
  });

  @override
  List<Object?> get props {
    return [
      firstname,
      lastname,
      phone,
      country,
      company,
      products,
      incoterm,
      portOfDestination,
      message,
    ];
  }
}

class RfqProduct {
  final String? productName;
  final double? quantity;
  final String? unit;

  const RfqProduct({
    this.productName,
    this.quantity,
    this.unit,
  });
}
