import 'package:mytradeasia/core/usecase/usecase.dart';
import 'package:mytradeasia/features/domain/repository/user_repository.dart';

class UpdateProfile implements UseCase<String, Map<String, dynamic>> {
  UserRepository _userRepository;

  UpdateProfile(this._userRepository);

  @override
  Future<String> call({required Map<String, dynamic> param}) {
    return _userRepository.updateProfile(param);
  }
}
