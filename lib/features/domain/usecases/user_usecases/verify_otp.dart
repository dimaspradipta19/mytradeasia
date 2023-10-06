import 'package:mytradeasia/core/usecase/usecase.dart';
import 'package:mytradeasia/features/domain/repository/user_repository.dart';

class VerifyOtp implements UseCase<bool, String> {
  final UserRepository _userRepository;

  VerifyOtp(this._userRepository);

  @override
  Future<bool> call({required String param}) async {
    return _userRepository.verifyOtp(param);
  }
}
