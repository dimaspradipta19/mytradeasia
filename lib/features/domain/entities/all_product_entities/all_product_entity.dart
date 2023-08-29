import 'package:equatable/equatable.dart';

class AllProductModel extends Equatable {
  const AllProductModel({
    required this.productname,
    required this.productimage,
    required this.hsCode,
    required this.casNumber,
    required this.seoUrl,
  });

  final String? productname;
  final String? productimage;
  final String? hsCode;
  final String? casNumber;
  final String? seoUrl;

  @override
  List<Object?> get props =>
      [productname, productimage, hsCode, casNumber, seoUrl];
}
