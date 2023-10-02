import 'package:firebase_auth/firebase_auth.dart';
import 'package:mytradeasia/features/domain/entities/user_entities/user_credential_entity.dart';

class UserCredentialModel extends UserCredentialEntity {
  const UserCredentialModel({
    String? displayName,
    String? email,
    bool? emailVerified,
    String? phoneNumber,
    String? photoUrl,
    String? uid,
  }) : super(
          displayName: displayName,
          email: email,
          emailVerified: emailVerified,
          phoneNumber: phoneNumber,
          photoUrl: photoUrl,
          uid: uid,
        );

  factory UserCredentialModel.fromUserCredential(
      UserCredential userCredential) {
    return UserCredentialModel(
      displayName: userCredential.user!.displayName,
      email: userCredential.user!.email,
      emailVerified: userCredential.user!.emailVerified,
      phoneNumber: userCredential.user!.phoneNumber,
      photoUrl: userCredential.user!.photoURL,
      uid: userCredential.user!.uid,
    );
  }

  factory UserCredentialModel.fromUser(User userCredential) {
    return UserCredentialModel(
      displayName: userCredential.displayName,
      email: userCredential.email,
      emailVerified: userCredential.emailVerified,
      phoneNumber: userCredential.phoneNumber,
      photoUrl: userCredential.photoURL,
      uid: userCredential.uid,
    );
  }
}
