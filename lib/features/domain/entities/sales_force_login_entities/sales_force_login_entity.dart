import 'package:equatable/equatable.dart';

class SalesforceLoginEntity extends Equatable {
  final String? accessToken;
  final String? instanceUrl;
  final String? id;
  final String? tokenType;
  final String? issuedAt;
  final String? signature;

  const SalesforceLoginEntity({
    this.accessToken,
    this.instanceUrl,
    this.id,
    this.tokenType,
    this.issuedAt,
    this.signature,
  });

  @override
  List<Object?> get props {
    return [
      this.accessToken,
      this.instanceUrl,
      this.id,
      this.tokenType,
      this.issuedAt,
      this.signature,
    ];
  }
}
