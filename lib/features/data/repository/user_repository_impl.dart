import 'package:mytradeasia/features/data/data_sources/firebase/auth_user_firebase.dart';
import 'package:mytradeasia/features/data/model/user_models/user_model.dart';
import 'package:mytradeasia/features/domain/entities/user_entities/user_entity.dart';
import 'package:mytradeasia/features/domain/repository/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final AuthUserFirebase _authUserFirebase;

  UserRepositoryImpl(this._authUserFirebase);

  @override
  Future<String> registerUser(UserEntity s) async {
    UserModel userData = UserModel(
      companyName: s.companyName,
      country: s.country,
      email: s.email,
      firstName: s.firstName,
      lastName: s.lastName,
      password: s.password,
      phone: s.phone,
      role: s.role,
    );
    final response = await _authUserFirebase.postRegisterUser(userData);
    return response;
  }

  @override
  Future<dynamic> loginUser(Map<String, String> s) async {
    final response = await _authUserFirebase.postLoginUser(s);
    return response;
  }

  @override
  Stream<Map<String, dynamic>> getUserSnapshot() {
    final uid = _authUserFirebase.getCurrentUId();
    return _authUserFirebase.getUserSnapshot(uid);
  }

  @override
  Future<String> getCurrentUserId() async {
    return _authUserFirebase.getCurrentUId();
  }

  @override
  void addRecentlySeen(Map<String, dynamic> s) {
    _authUserFirebase.addRecentlySeen(s);
  }
}
