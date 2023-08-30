import 'package:equatable/equatable.dart';

class SearchProductEntity extends Equatable {
  final String? productname;
  final String? productimage;
  final String? hsCode;
  final String? casNumber;
  final String? seoUrl;

  const SearchProductEntity({
    this.productname,
    this.productimage,
    this.hsCode,
    this.casNumber,
    this.seoUrl,
  });

  @override
  List<Object?> get props {
    return [
      this.productname,
      this.productimage,
      this.hsCode,
      this.casNumber,
      this.seoUrl,
    ];
  }
}