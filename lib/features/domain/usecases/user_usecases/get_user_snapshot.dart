import 'package:mytradeasia/core/usecase/stream_usecase.dart';
import 'package:mytradeasia/features/domain/repository/user_repository.dart';

class GetUserSnapshot
    implements StreamUseCase<Stream<Map<String, dynamic>>, void> {
  final UserRepository _userRepository;

  GetUserSnapshot(this._userRepository);

  @override
  Stream<Map<String, dynamic>> call({void param}) {
    return _userRepository.getUserSnapshot();
  }
}
