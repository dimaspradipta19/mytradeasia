import 'package:mytradeasia/core/usecase/usecase.dart';
import 'package:mytradeasia/features/domain/repository/user_repository.dart';

class LogOutUser implements UseCase<void, void> {
  final UserRepository _userRepository;

  LogOutUser(this._userRepository);

  @override
  Future<void> call({void param}) async {
    return _userRepository.logoutUser();
  }
}
