import 'package:mytradeasia/features/domain/entities/user_entities/user_entity.dart';

abstract class UserRepository {
  Future<String> registerUser(UserEntity s);
}
