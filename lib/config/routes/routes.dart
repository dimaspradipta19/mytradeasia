import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mytradeasia/view/auth/biodata/biodata_screen.dart';
import 'package:mytradeasia/view/auth/choose_role/role_user_screen.dart';
import 'package:mytradeasia/view/auth/login/forgot_password/forgot_password_screen.dart';
import 'package:mytradeasia/view/auth/login/forgot_password/reset_password_screen.dart';
import 'package:mytradeasia/view/auth/login/login_screen.dart';
import 'package:mytradeasia/view/auth/register/register_screen.dart';
import 'package:mytradeasia/view/menu/history/history_screen.dart';
import 'package:mytradeasia/view/menu/home/home_screen.dart';
import 'package:mytradeasia/view/menu/messages/messages_screen.dart';
import 'package:mytradeasia/view/menu/mytradeasia/mytradeasia_screen.dart';
import 'package:mytradeasia/view/menu/other/navigation_bar.dart';
import 'package:mytradeasia/view/menu/other/splash_page.dart';

final GlobalKey<NavigatorState> _shellNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'shell');

class Routes {
  GoRouter router =
      GoRouter(initialLocation: "/", debugLogDiagnostics: true, routes: [
    GoRoute(
        path: "/",
        builder: (context, state) => const SplashScreen(),
        redirect: (context, state) => '/'),
    // GoRoute(
    //     path: "/home",
    //     builder: (context, state) => const NavigationBarWidget()),
    ShellRoute(
        navigatorKey: _shellNavigatorKey,
        builder: (BuildContext context, GoRouterState state, Widget child) =>
            NavigationBarWidget(
              child: child,
            ),
        routes: [
          GoRoute(
              path: "/home",
              pageBuilder: (context, state) => NoTransitionPage(
                  child: const HomeScreen(), key: state.pageKey)),
          GoRoute(
              path: "/message",
              pageBuilder: (context, state) => NoTransitionPage(
                  child: const MessageScreen(), key: state.pageKey)),
          GoRoute(
              path: "/history",
              pageBuilder: (context, state) => NoTransitionPage(
                  child: const HistoryScreen(), key: state.pageKey)),
          GoRoute(
              path: "/mytradeasia",
              pageBuilder: (context, state) => NoTransitionPage(
                  child: const MyTradeAsiaScreen(), key: state.pageKey))
        ]),
    GoRoute(
        path: "/auth",
        name: "choose_role",
        builder: (context, state) => const RoleUserScreen(),
        routes: [
          GoRoute(
              path: "login",
              builder: (context, state) => const LoginScreen(),
              routes: [
                GoRoute(
                    path: "forgot_password",
                    builder: (context, state) => const ForgotPasswordScreen()),
                // TODO : add email parameter (reset_password/:email) that will be passed to ResetPasswordScreen(email : state.pathParameters['email])
                GoRoute(
                    path: "reset_password",
                    builder: (context, state) => const ResetPasswordScreen())
              ]),
          GoRoute(
              path: "register",
              builder: (context, state) => const RegisterScreen(),
              routes: [
                GoRoute(
                    path: "biodata",
                    builder: (context, state) => const BiodataScreen())
              ]),
        ]),
  ]);
}
