import 'dart:convert';

import 'package:mytradeasia/features/domain/entities/sales_force_data_entities/sales_force_data_entity.dart';

class SalesforceDataModel extends SalesforceDataEntity {
  const SalesforceDataModel({
    int? totalSize,
    bool? done,
    String? nextRecordsUrl,
    List<_RecordModel>? records,
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
        records: List<_RecordModel>.from(
            json["records"].map((x) => _RecordModel.fromJson(x))),
      );
}

class _RecordModel extends Record {
  const _RecordModel({
    _AttributesModel? attributes,
    String? id,
    String? name,
    String? phone,
  }) : super(id: id, attributes: attributes, name: name, phone: phone);

  factory _RecordModel.fromRawJson(String str) =>
      _RecordModel.fromJson(json.decode(str));

  factory _RecordModel.fromJson(Map<String, dynamic> json) => _RecordModel(
        attributes: _AttributesModel.fromJson(json["attributes"]),
        id: json["Id"],
        name: json["Name"],
        phone: json["Phone"] ?? "Null",
      );
}

class _AttributesModel extends Attributes {
  const _AttributesModel({
    String? type,
    String? url,
  }) : super(type: type, url: url);

  factory _AttributesModel.fromRawJson(String str) =>
      _AttributesModel.fromJson(json.decode(str));

  factory _AttributesModel.fromJson(Map<String, dynamic> json) =>
      _AttributesModel(
        type: json["type"]!,
        url: json["url"],
      );
}
