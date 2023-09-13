import 'package:mytradeasia/features/domain/entities/product_entities/product_entity.dart';

class TopProductEntity extends ProductEntity {
  final int? priority;

  const TopProductEntity({
    String? productimage,
    String? productname,
    String? casNumber,
    String? hsCode,
    String? seoUrl,
    this.priority,
  }) : super(
          productname: productname,
          productimage: productimage,
          hsCode: hsCode,
          casNumber: casNumber,
          seoUrl: seoUrl,
        );

  @override
  List<Object?> get props {
    return super.props..add(priority);
  }
}
