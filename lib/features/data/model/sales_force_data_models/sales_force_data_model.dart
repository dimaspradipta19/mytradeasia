import 'dart:convert';

import 'package:mytradeasia/features/domain/entities/sales_force_data_entities/sales_force_data_entity.dart';

class SalesforceDataModel extends SalesforceDataEntity {
  const SalesforceDataModel({
    int? totalSize,
    bool? done,
    String? nextRecordsUrl,
    List<RecordModel>? records,
  }) : super(
          totalSize: totalSize,
          done: done,
          nextRecordsUrl: nextRecordsUrl,
          records: records,
        );

  factory SalesforceDataModel.fromRawJson(String str) =>
      SalesforceDataModel.fromJson(json.decode(str));

  factory SalesforceDataModel.fromJson(Map<String, dynamic> json) =>
      SalesforceDataModel(
        totalSize: json["totalSize"],
        done: json["done"],
        nextRecordsUrl: json["nextRecordsUrl"],
        records: List<RecordModel>.from(
            json["records"].map((x) => RecordModel.fromJson(x))),
      );
}

class RecordModel extends Record {
  const RecordModel({
    AttributesModel? attributes,
    String? id,
    String? name,
    String? phone,
  }) : super(id: id, attributes: attributes, name: name, phone: phone);

  factory RecordModel.fromRawJson(String str) =>
      RecordModel.fromJson(json.decode(str));

  factory RecordModel.fromJson(Map<String, dynamic> json) => RecordModel(
        attributes: AttributesModel.fromJson(json["attributes"]),
        id: json["Id"],
        name: json["Name"],
        phone: json["Phone"] ?? "Null",
      );
}

class AttributesModel extends Attributes {
  const AttributesModel({
    String? type,
    String? url,
  }) : super(type: type, url: url);

  factory AttributesModel.fromRawJson(String str) =>
      AttributesModel.fromJson(json.decode(str));

  factory AttributesModel.fromJson(Map<String, dynamic> json) =>
      AttributesModel(
        type: json["type"]!,
        url: json["url"],
      );
}
