import 'package:mytradeasia/core/usecase/usecase.dart';
import 'package:mytradeasia/features/domain/repository/user_repository.dart';

class AddRecentlySeen implements UseCase<void, Map<String, dynamic>> {
  final UserRepository _userRepository;

  AddRecentlySeen(this._userRepository);

  @override
  Future<void> call({required Map<String, dynamic> param}) async {
    _userRepository.addRecentlySeen(param);
  }
}
