import 'package:equatable/equatable.dart';

class AllIndustryEntity extends Equatable {
  const AllIndustryEntity({
    required this.detailIndustry,
  });

  final List<DetailIndustry>? detailIndustry;

  @override
  List<Object?> get props => [detailIndustry];
}

class DetailIndustry {
  const DetailIndustry({
    required this.industryUrl,
    required this.industryName,
    required this.industryImage,
    required this.category,
  });

  final String industryUrl;
  final String industryName;
  final String industryImage;
  final List<Category> category;
}

class Category {
  const Category({
    required this.categoryName,
    required this.seoUrl,
  });

  final String categoryName;
  final String seoUrl;
}
