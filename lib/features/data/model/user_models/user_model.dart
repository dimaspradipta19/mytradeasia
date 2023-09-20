import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mytradeasia/features/domain/entities/user_entities/user_entity.dart';

class UserModel extends UserEntity {
  const UserModel({
    String? email,
    String? password,
    String? role,
    String? companyName,
    String? country,
    String? firstName,
    String? lastName,
    String? phone,
  }) : super(
          email: email,
          password: password,
          role: role,
          companyName: companyName,
          country: country,
          firstName: firstName,
          lastName: lastName,
          phone: phone,
        );

  Map<String, dynamic> toMap() {
    return {
      'role': role,
      'companyName': companyName,
      'country': country,
      'firstName': firstName,
      'lastName': lastName,
      'phoneNumber': phone,
    };
  }

  factory UserModel.fromSnapshot(DocumentSnapshot documentSnapshot) {
    return UserModel(
      role: documentSnapshot.get('role'),
      companyName: documentSnapshot.get('companyName'),
      country: documentSnapshot.get('country'),
      firstName: documentSnapshot.get('firstName'),
      lastName: documentSnapshot.get('lastName'),
      phone: documentSnapshot.get('phone'),
    );
  }
}
