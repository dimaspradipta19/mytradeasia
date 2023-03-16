class AllIndustryModel {
  AllIndustryModel({
    required this.id,
    required this.businessId,
    required this.prodindImage,
    required this.brochure,
    required this.publish,
    required this.createdBy,
    required this.updatedBy,
    required this.deleteStatus,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
    required this.prodindId,
    required this.languageId,
    required this.prodindName,
    required this.prodindDesc,
    required this.prodindUrl,
    required this.domainId,
    required this.seoUrl,
    required this.seoKeyword,
    required this.seoTitle,
    required this.seoDesc,
  });

  int id;
  int businessId;
  String prodindImage;
  String? brochure;
  int publish;
  int? createdBy;
  int? updatedBy;
  dynamic deleteStatus;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic deletedAt;
  int prodindId;
  int languageId;
  String prodindName;
  String prodindDesc;
  String prodindUrl;
  int domainId;
  String? seoUrl;
  String? seoKeyword;
  String? seoTitle;
  String? seoDesc;

  factory AllIndustryModel.fromJson(Map<String, dynamic> json) =>
      AllIndustryModel(
        id: json["id"],
        businessId: json["business_id"],
        prodindImage: json["prodind_image"],
        brochure: json["brochure"] ?? "",
        publish: json["publish"],
        createdBy: json["created_by"] ?? 0,
        updatedBy: json["updated_by"] ?? 0,
        deleteStatus: json["delete_status"] ?? "",
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        deletedAt: json["deleted_at"] ?? "",
        prodindId: json["prodind_id"],
        languageId: json["language_id"],
        prodindName: json["prodind_name"],
        prodindDesc: json["prodind_desc"],
        prodindUrl: json["prodind_url"],
        domainId: json["domain_id"],
        seoUrl: json["seo_url"] ?? "",
        seoKeyword: json["seo_keyword"] ?? "",
        seoTitle: json["seo_title"] ?? "",
        seoDesc: json["seo_desc"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "business_id": businessId,
        "prodind_image": prodindImage,
        "brochure": brochure,
        "publish": publish,
        "created_by": createdBy,
        "updated_by": updatedBy,
        "delete_status": deleteStatus,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "deleted_at": deletedAt,
        "prodind_id": prodindId,
        "language_id": languageId,
        "prodind_name": prodindName,
        "prodind_desc": prodindDesc,
        "prodind_url": prodindUrl,
        "domain_id": domainId,
        "seo_url": seoUrl ?? "",
        "seo_keyword": seoKeyword,
        "seo_title": seoTitle,
        "seo_desc": seoDesc,
      };
}
