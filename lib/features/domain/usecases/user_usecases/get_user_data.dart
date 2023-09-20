import 'package:mytradeasia/core/usecase/usecase.dart';
import 'package:mytradeasia/features/domain/repository/user_repository.dart';

class GetUserData implements UseCase<Map<String, dynamic>, void> {
  UserRepository _userRepository;

  GetUserData(this._userRepository);

  @override
  Future<Map<String, dynamic>> call({void param}) async {
    return _userRepository.getUserData();
  }
}
