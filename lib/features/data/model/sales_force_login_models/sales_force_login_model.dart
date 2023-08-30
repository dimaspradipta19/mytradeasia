import 'package:mytradeasia/features/domain/entities/sales_force_login_entities/sales_force_login_entity.dart';

class SalesforceLoginModel extends SalesforceLoginEntity {
  const SalesforceLoginModel({
    String? accessToken,
    String? instanceUrl,
    String? id,
    String? tokenType,
    String? issuedAt,
    String? signature,
  }) : super(
          accessToken: accessToken,
          instanceUrl: instanceUrl,
          id: id,
          tokenType: tokenType,
          issuedAt: issuedAt,
          signature: signature,
        );

  factory SalesforceLoginModel.fromJson(Map<String, dynamic> json) =>
      SalesforceLoginModel(
        accessToken: json["access_token"],
        instanceUrl: json["instance_url"],
        id: json["id"],
        tokenType: json["token_type"],
        issuedAt: json["issued_at"],
        signature: json["signature"],
      );
}
