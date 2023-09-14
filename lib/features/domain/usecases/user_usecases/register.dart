import 'package:mytradeasia/core/usecase/usecase.dart';
import 'package:mytradeasia/features/domain/repository/user_repository.dart';

import '../../entities/user_entities/user_entity.dart';

class RegisterUser implements UseCase<String, UserEntity> {
  final UserRepository _userRepository;

  RegisterUser(this._userRepository);

  @override
  Future<String> call({required UserEntity param}) {
    return _userRepository.registerUser(param);
  }
}
