import 'package:equatable/equatable.dart';

abstract class ProductEntity extends Equatable {
  final String? productname;
  final String? productimage;
  final String? hsCode;
  final String? casNumber;
  final String? seoUrl;

  const ProductEntity({
    this.productname,
    this.productimage,
    this.hsCode,
    this.casNumber,
    this.seoUrl,
  });

  @override
  List<Object?> get props {
    return [
      productname,
      productimage,
      hsCode,
      casNumber,
      seoUrl,
    ];
  }
}
