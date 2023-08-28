import 'package:equatable/equatable.dart';

class TopProductEntity extends Equatable {
  final String? productimage;
  final String? productname;
  final String? casNumber;
  final String? hsCode;

  const TopProductEntity({
    this.productimage,
    this.productname,
    this.casNumber,
    this.hsCode,
  });

  @override
  // TODO: implement props
  List<Object?> get props {
    return [
      this.productimage,
      this.productname,
      this.casNumber,
      this.hsCode,
    ];
  }
}
