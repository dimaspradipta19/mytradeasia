import 'package:mytradeasia/features/domain/entities/all_industry_entities/all_industry_entity.dart';

class AllIndustryModel extends AllIndustryEntity {
  const AllIndustryModel({
    List<_DetailIndustryModel>? detailIndustryModel,
  }) : super(detailIndustry: detailIndustryModel);

  factory AllIndustryModel.fromJson(Map<String, dynamic> json) =>
      AllIndustryModel(
        detailIndustryModel: List<_DetailIndustryModel>.from(
            json["detail-industry"]
                .map((x) => _DetailIndustryModel.fromJson(x))),
      );
}

class _DetailIndustryModel extends DetailIndustry {
  const _DetailIndustryModel({
    String? industryUrl,
    String? industryName,
    String? industryImage,
    List<_CategoryModel>? category,
  }) : super(
          industryUrl: industryUrl,
          industryName: industryName,
          industryImage: industryImage,
          category: category,
        );

  factory _DetailIndustryModel.fromJson(Map<String, dynamic> json) =>
      _DetailIndustryModel(
        industryUrl: json["industry_url"],
        industryName: json["industry_name"],
        industryImage: json["industry_image"],
        category: List<_CategoryModel>.from(
            json["category"].map((x) => _CategoryModel.fromJson(x))),
      );
}

class _CategoryModel extends Category {
  const _CategoryModel({
    String? categoryName,
    String? seoUrl,
  }) : super(categoryName: categoryName, seoUrl: seoUrl);

  factory _CategoryModel.fromJson(Map<String, dynamic> json) => _CategoryModel(
        categoryName: json["category_name"],
        seoUrl: json["seo_url"],
      );
}
