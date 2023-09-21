import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mytradeasia/features/domain/entities/user_entities/user_credential_entity.dart';
import 'package:mytradeasia/features/domain/usecases/user_usecases/login.dart';
import 'package:mytradeasia/features/domain/usecases/user_usecases/logout.dart';
import 'package:mytradeasia/features/domain/usecases/user_usecases/register.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../old_file_tobedeleted/widget/dialog_sheet_widget.dart';
import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final RegisterUser _postRegisterUser;
  final LoginUser _postLoginUser;
  final LogOutUser _postLogoutUser;

  AuthBloc(this._postRegisterUser, this._postLoginUser, this._postLogoutUser)
      : super(const AuthInitState()) {
    on<LoginWithEmail>((event, emit) async {
      BuildContext context = event.context;

      final response = await _postLoginUser
          .call(param: {"email": event.email, "password": event.password});
      if (response is UserCredentialEntity) {
        emit(AuthLoggedInState(response));
        context.go("/home");
      } else {
        if (response == "user-not-found") {
          showDialog(
            context: context,
            builder: (context) => DialogWidget(
                urlIcon: "assets/images/logo_delete_account.png",
                title: "Wrong Email",
                subtitle: "No user found for that email.",
                textForButton: "Go back",
                navigatorFunction: () {
                  context.pop(context);
                }),
          );
        } else if (response == 'wrong-password') {
          showDialog(
            context: context,
            builder: (context) => DialogWidget(
                urlIcon: "assets/images/logo_delete_account.png",
                title: "Wrong Password",
                subtitle: "Wrong password provided for that user.",
                textForButton: "Go back",
                navigatorFunction: () {
                  context.pop(context);
                }),
          );
        }
      }
    });
    on<RegisterWithEmail>((event, emit) async {
      BuildContext context = event.context;

      final response = await _postRegisterUser.call(param: event.userData);
      if (response == "success") {
        log("register success");
      } else {
        log(response);
        showDialog(
          context: context,
          builder: (context) => DialogWidget(
              urlIcon: "assets/images/logo_delete_account.png",
              title: "Email already in use",
              subtitle: "Try another email for registration",
              textForButton: "Go back",
              navigatorFunction: () {
                Navigator.pop(context);
              }),
        );
      }
    });

    on<AuthLoading>(
      (event, emit) => emit(const AuthLoadingState()),
    );

    on<LogOut>((event, emit) async {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setBool("isLoggedIn", false);
      prefs.clear();
      _postLogoutUser.call();
      emit(const AuthInitState());
    });
  }
}
