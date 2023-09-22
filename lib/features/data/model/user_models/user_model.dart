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
      role: documentSnapshot.data().toString().contains('role')
          ? documentSnapshot.get('role')
          : "",
      companyName: documentSnapshot.data().toString().contains('companyName')
          ? documentSnapshot.get('companyName')
          : "",
      country: documentSnapshot.data().toString().contains('country')
          ? documentSnapshot.get('country')
          : "",
      firstName: documentSnapshot.data().toString().contains('firstName')
          ? documentSnapshot.get('firstName')
          : "",
      lastName: documentSnapshot.data().toString().contains('lastName')
          ? documentSnapshot.get('lastName')
          : "",
      phone: documentSnapshot.data().toString().contains('phone')
          ? documentSnapshot.get('phone')
          : "",
    );
  }
}
