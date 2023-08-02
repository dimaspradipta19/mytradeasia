// To parse this JSON data, do
//
//     final salesforceLoginModel = salesforceLoginModelFromJson(jsonString);

// import 'dart:convert';

// SalesforceLoginModel salesforceLoginModelFromJson(String str) => SalesforceLoginModel.fromJson(json.decode(str));

// String salesforceLoginModelToJson(SalesforceLoginModel data) => json.encode(data.toJson());

class SalesforceLoginModel {
    final String accessToken;
    final String instanceUrl;
    final String id;
    final String tokenType;
    final String issuedAt;
    final String signature;

    SalesforceLoginModel({
        required this.accessToken,
        required this.instanceUrl,
        required this.id,
        required this.tokenType,
        required this.issuedAt,
        required this.signature,
    });

    factory SalesforceLoginModel.fromJson(Map<String, dynamic> json) => SalesforceLoginModel(
        accessToken: json["access_token"],
        instanceUrl: json["instance_url"],
        id: json["id"],
        tokenType: json["token_type"],
        issuedAt: json["issued_at"],
        signature: json["signature"],
    );

    Map<String, dynamic> toJson() => {
        "access_token": accessToken,
        "instance_url": instanceUrl,
        "id": id,
        "token_type": tokenType,
        "issued_at": issuedAt,
        "signature": signature,
    };
}
