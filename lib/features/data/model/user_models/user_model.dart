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
    String? phoneNumber,
  }) : super(
          email: email,
          password: password,
          role: role,
          companyName: companyName,
          country: country,
          firstName: firstName,
          lastName: lastName,
          phoneNumber: phoneNumber,
        );

  Map<String, dynamic> toMap() {
    return {
      'role': role,
      'companyName': companyName,
      'country': country,
      'firstName': firstName,
      'lastName': lastName,
      'phoneNumber': phoneNumber,
    };
  }
}
