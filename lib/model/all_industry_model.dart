// class AllIndustryModel {
//     AllIndustryModel({
//         required this.detailIndustry,
//     });

//     List<DetailIndustry> detailIndustry;

//     factory AllIndustryModel.fromJson(Map<String, dynamic> json) => AllIndustryModel(
//         detailIndustry: List<DetailIndustry>.from(json["detail-industry"].map((x) => DetailIndustry.fromJson(x))),
//     );

//     Map<String, dynamic> toJson() => {
//         "detail-industry": List<dynamic>.from(detailIndustry.map((x) => x.toJson())),
//     };
// }

// class DetailIndustry {
//     DetailIndustry({
//         required this.industryUrl,
//         required this.industryName,
//         required this.industryImage,
//         required this.category,
//     });

//     String industryUrl;
//     String industryName;
//     String industryImage;
//     List<Category> category;

//     factory DetailIndustry.fromJson(Map<String, dynamic> json) => DetailIndustry(
//         industryUrl: json["industry_url"],
//         industryName: json["industry_name"],
//         industryImage: json["industry_image"],
//         category: List<Category>.from(json["category"].map((x) => Category.fromJson(x))),
//     );

//     Map<String, dynamic> toJson() => {
//         "industry_url": industryUrl,
//         "industry_name": industryName,
//         "industry_image": industryImage,
//         "category": List<dynamic>.from(category.map((x) => x.toJson())),
//     };
// }

// class Category {
//     Category({
//         required this.categoryName,
//         required this.seoUrl,
//     });

//     String categoryName;
//     String seoUrl;

//     factory Category.fromJson(Map<String, dynamic> json) => Category(
//         categoryName: json["category_name"],
//         seoUrl: json["seo_url"],
//     );

//     Map<String, dynamic> toJson() => {
//         "category_name": categoryName,
//         "seo_url": seoUrl,
//     };
// }

import 'dart:convert';

class AllIndustryModel {
  final List<DetailIndustry> detailIndustry;

  AllIndustryModel({
    required this.detailIndustry,
  });

  factory AllIndustryModel.fromRawJson(String str) =>
      AllIndustryModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory AllIndustryModel.fromJson(Map<String, dynamic> json) =>
      AllIndustryModel(
        detailIndustry: List<DetailIndustry>.from(
            json["detail-industry"].map((x) => DetailIndustry.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "detail-industry":
            List<dynamic>.from(detailIndustry.map((x) => x.toJson())),
      };
}

class DetailIndustry {
  final String industryUrl;
  final String industryName;
  final dynamic industryImage;
  final List<Category> category;

  DetailIndustry({
    required this.industryUrl,
    required this.industryName,
    required this.industryImage,
    required this.category,
  });

  factory DetailIndustry.fromRawJson(String str) =>
      DetailIndustry.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory DetailIndustry.fromJson(Map<String, dynamic> json) => DetailIndustry(
        industryUrl: json["industry_url"],
        industryName: json["industry_name"],
        industryImage: json["industry_image"],
        category: List<Category>.from(
            json["category"].map((x) => Category.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "industry_url": industryUrl,
        "industry_name": industryName,
        "industry_image": industryImage,
        "category": List<dynamic>.from(category.map((x) => x.toJson())),
      };
}

class Category {
  final String categoryName;
  final String seoUrl;

  Category({
    required this.categoryName,
    required this.seoUrl,
  });

  factory Category.fromRawJson(String str) =>
      Category.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        categoryName: json["category_name"],
        seoUrl: json["seo_url"],
      );

  Map<String, dynamic> toJson() => {
        "category_name": categoryName,
        "seo_url": seoUrl,
      };
}
