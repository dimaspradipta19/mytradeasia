import 'package:mytradeasia/features/domain/entities/product_entities/product_entity.dart';

class AllProductEntities extends ProductEntity {
  const AllProductEntities({
    String? productname,
    String? productimage,
    String? hsCode,
    String? casNumber,
    String? seoUrl,
  }) : super(
          productname: productname,
          productimage: productimage,
          hsCode: hsCode,
          casNumber: casNumber,
          seoUrl: seoUrl,
        );
}
