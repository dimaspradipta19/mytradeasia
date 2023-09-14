import 'package:mytradeasia/core/usecase/usecase.dart';
import 'package:mytradeasia/features/domain/repository/user_repository.dart';

class LoginUser implements UseCase<dynamic, Map<String, String>> {
  final UserRepository _userRepository;

  LoginUser(this._userRepository);

  @override
  Future<dynamic> call({required Map<String, String> param}) {
    return _userRepository.loginUser(param);
  }
}
