import 'package:mytradeasia/core/usecase/usecase.dart';
import 'package:mytradeasia/features/domain/entities/user_entities/user_credential_entity.dart';
import 'package:mytradeasia/features/domain/repository/user_repository.dart';

class GetUserCredentials implements UseCase<UserCredentialEntity, void> {
  UserRepository _userRepository;

  GetUserCredentials(this._userRepository);

  @override
  Future<UserCredentialEntity> call({void param}) async {
    return _userRepository.getUserCredentials();
  }
}
