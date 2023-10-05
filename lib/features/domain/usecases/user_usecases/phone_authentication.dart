import 'package:mytradeasia/core/usecase/usecase.dart';
import 'package:mytradeasia/features/domain/repository/user_repository.dart';

class PhoneAuthentication implements UseCase<String, String> {
  final UserRepository _userRepository;

  PhoneAuthentication(this._userRepository);

  @override
  Future<String> call({required String param}) async {
    return _userRepository.phoneAuthentication(param);
  }
}
