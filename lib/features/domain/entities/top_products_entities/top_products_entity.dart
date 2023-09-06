import 'package:equatable/equatable.dart';

class TopProductEntity extends Equatable {
  final String? productimage;
  final String? productname;
  final String? casNumber;
  final String? hsCode;
  final String? seoUrl;
  final int? priority;

  const TopProductEntity(
      {this.productimage,
      this.productname,
      this.casNumber,
      this.hsCode,
      this.seoUrl,
      this.priority});

  @override
  List<Object?> get props {
    return [
      this.productimage,
      this.productname,
      this.casNumber,
      this.hsCode,
      this.seoUrl,
      this.priority
    ];
  }
}
