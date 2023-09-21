import 'package:equatable/equatable.dart';

class UserCredentialEntity extends Equatable {
  final String? displayName;
  final String? email;
  final bool? emailVerified;
  final String? phoneNumber;
  final String? photoUrl;
  final String? uid;

  const UserCredentialEntity({
    this.displayName,
    this.email,
    this.emailVerified,
    this.phoneNumber,
    this.photoUrl,
    this.uid,
  });

  @override
  List<Object?> get props {
    return [
      displayName,
      email,
      emailVerified,
      phoneNumber,
      photoUrl,
      uid,
    ];
  }
}
