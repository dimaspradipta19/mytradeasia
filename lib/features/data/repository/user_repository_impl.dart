import 'package:mytradeasia/features/data/data_sources/firebase/auth_user_firebase.dart';
import 'package:mytradeasia/features/data/model/user_models/user_model.dart';
import 'package:mytradeasia/features/domain/entities/user_entities/user_credential_entity.dart';
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
    if (response is Map) {
      if (response["code"] == "user-not-found") {
        return "user-not-found";
      }
      if (response["code"] == 'wrong-password') {
        return "wrong-password";
      }
    }
    return response;
  }

  @override
  Stream<Map<String, dynamic>> getUserSnapshot() {
    final uid = _authUserFirebase.getCurrentUId();
    // var test = _authUserFirebase.getUserSnapshot(uid);

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

  @override
  Future<List> getRecentlySeen() async {
    return _authUserFirebase.getRecentlySeen();
  }

  @override
  Future<Map<String, dynamic>> getUserData() {
    return _authUserFirebase.getUserData();
  }

  @override
  void logoutUser() {
    _authUserFirebase.postLogoutUser();
  }

  @override
  Future<UserCredentialEntity> getUserCredentials() {
    return _authUserFirebase.getUserCredentials();
  }

  @override
  Future<String> updateProfile(Map<String, dynamic> data) {
    return _authUserFirebase.updateProfile(data);
  }
}
