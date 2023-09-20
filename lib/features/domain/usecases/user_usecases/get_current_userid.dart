import 'package:mytradeasia/core/usecase/usecase.dart';
import 'package:mytradeasia/features/domain/repository/user_repository.dart';

class GetCurrentUserId implements UseCase<String, void> {
  final UserRepository _userRepository;

  GetCurrentUserId(this._userRepository);

  @override
  Future<String> call({void param}) {
    return _userRepository.getCurrentUserId();
  }
}
