import 'package:mytradeasia/core/usecase/usecase.dart';
import 'package:mytradeasia/features/domain/repository/user_repository.dart';

class GetRecentlySeen implements UseCase<List<dynamic>, void> {
  final UserRepository _userRepository;

  GetRecentlySeen(this._userRepository);

  @override
  Future<List> call({void param}) {
    return _userRepository.getRecentlySeen();
  }
}
