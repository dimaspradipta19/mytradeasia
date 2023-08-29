import 'package:mytradeasia/features/domain/entities/all_industry_entities/all_industry_entity.dart';

class AllIndustryModel extends AllIndustryEntity {
  const AllIndustryModel({
    List<DetailIndustryModel>? detailIndustryModel,
  }) : super(detailIndustry: detailIndustryModel);

  factory AllIndustryModel.fromJson(Map<String, dynamic> json) =>
      AllIndustryModel(
        detailIndustryModel: List<DetailIndustryModel>.from(
            json["detail-industry"]
                .map((x) => DetailIndustryModel.fromJson(x))),
      );
}

class DetailIndustryModel extends DetailIndustry {
  const DetailIndustryModel({
    String? industryUrl,
    String? industryName,
    String? industryImage,
    List<CategoryModel>? category,
  }) : super(
          industryUrl: industryUrl,
          industryName: industryName,
          industryImage: industryImage,
          category: category,
        );

  factory DetailIndustryModel.fromJson(Map<String, dynamic> json) =>
      DetailIndustryModel(
        industryUrl: json["industry_url"],
        industryName: json["industry_name"],
        industryImage: json["industry_image"],
        category: List<CategoryModel>.from(
            json["category"].map((x) => CategoryModel.fromJson(x))),
      );
}

class CategoryModel extends Category {
  const CategoryModel({
    String? categoryName,
    String? seoUrl,
  }) : super(categoryName: categoryName, seoUrl: seoUrl);

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
        categoryName: json["category_name"],
        seoUrl: json["seo_url"],
      );
}
