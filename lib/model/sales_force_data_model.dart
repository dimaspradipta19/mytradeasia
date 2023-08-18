import 'dart:convert';

class SalesforceDataModel {
  final int totalSize;
  final bool done;
  final String nextRecordsUrl;
  final List<Record> records;

  SalesforceDataModel({
    required this.totalSize,
    required this.done,
    required this.nextRecordsUrl,
    required this.records,
  });

  factory SalesforceDataModel.fromRawJson(String str) =>
      SalesforceDataModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory SalesforceDataModel.fromJson(Map<String, dynamic> json) =>
      SalesforceDataModel(
        totalSize: json["totalSize"],
        done: json["done"],
        nextRecordsUrl: json["nextRecordsUrl"],
        records:
            List<Record>.from(json["records"].map((x) => Record.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "totalSize": totalSize,
        "done": done,
        "nextRecordsUrl": nextRecordsUrl,
        "records": List<dynamic>.from(records.map((x) => x.toJson())),
      };
}

class Record {
  final Attributes attributes;
  final String id;
  final String name;
  final String? phone;

  Record({
    required this.attributes,
    required this.id,
    required this.name,
    required this.phone,
  });

  factory Record.fromRawJson(String str) => Record.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Record.fromJson(Map<String, dynamic> json) => Record(
        attributes: Attributes.fromJson(json["attributes"]),
        id: json["Id"],
        name: json["Name"],
        phone: json["Phone"] ?? "Null",
      );

  Map<String, dynamic> toJson() => {
        "attributes": attributes.toJson(),
        "Id": id,
        "Name": name,
        "Phone": phone,
      };
}

class Attributes {
  final Type type;
  final String url;

  Attributes({
    required this.type,
    required this.url,
  });

  factory Attributes.fromRawJson(String str) =>
      Attributes.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Attributes.fromJson(Map<String, dynamic> json) => Attributes(
        type: typeValues.map[json["type"]]!,
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "type": typeValues.reverse[type],
        "url": url,
      };
}

enum Type { ACCOUNT }

final typeValues = EnumValues({"Account": Type.ACCOUNT});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
