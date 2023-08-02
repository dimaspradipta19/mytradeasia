// To parse this JSON data, do
//
//     final salesforceDataModel = salesforceDataModelFromJson(jsonString);

// import 'package:meta/meta.dart';
// import 'dart:convert';

// SalesforceDataModel salesforceDataModelFromJson(String str) => SalesforceDataModel.fromJson(json.decode(str));

// String salesforceDataModelToJson(SalesforceDataModel data) => json.encode(data.toJson());

class SalesforceDataModel {
    final int totalSize;
    final bool done;
    final List<Record> records;

    SalesforceDataModel({
        required this.totalSize,
        required this.done,
        required this.records,
    });

    factory SalesforceDataModel.fromJson(Map<String, dynamic> json) => SalesforceDataModel(
        totalSize: json["totalSize"],
        done: json["done"],
        records: List<Record>.from(json["records"].map((x) => Record.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "totalSize": totalSize,
        "done": done,
        "records": List<dynamic>.from(records.map((x) => x.toJson())),
    };
}

class Record {
    final Attributes attributes;
    final String id;
    final String name;
    final String phone;

    Record({
        required this.attributes,
        required this.id,
        required this.name,
        required this.phone,
    });

    factory Record.fromJson(Map<String, dynamic> json) => Record(
        attributes: Attributes.fromJson(json["attributes"]),
        id: json["Id"],
        name: json["Name"],
        phone: json["Phone"],
    );

    Map<String, dynamic> toJson() => {
        "attributes": attributes.toJson(),
        "Id": id,
        "Name": name,
        "Phone": phone,
    };
}

class Attributes {
    final String type;
    final String url;

    Attributes({
        required this.type,
        required this.url,
    });

    factory Attributes.fromJson(Map<String, dynamic> json) => Attributes(
        type: json["type"],
        url: json["url"],
    );

    Map<String, dynamic> toJson() => {
        "type": type,
        "url": url,
    };
}
