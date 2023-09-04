import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthState extends Equatable {
  final User? user;

  const AuthState({this.user});

  @override
  List<Object> get props => [user!];
}

class AuthInitState extends AuthState {
  const AuthInitState();
}

class AuthLoadingState extends AuthState {
  const AuthLoadingState();
}

class AuthErrorState extends AuthState {
  final FirebaseAuthException error;
  const AuthErrorState(this.error);
}

class AuthLoggedInState extends AuthState {
  const AuthLoggedInState(User? user) : super(user: user);
}
