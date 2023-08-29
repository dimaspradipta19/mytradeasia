import 'package:go_router/go_router.dart';
import 'package:mytradeasia/view/auth/biodata/biodata_screen.dart';
import 'package:mytradeasia/view/auth/choose_role/role_user_screen.dart';
import 'package:mytradeasia/view/auth/login/forgot_password/forgot_password_screen.dart';
import 'package:mytradeasia/view/auth/login/forgot_password/reset_password_screen.dart';
import 'package:mytradeasia/view/auth/login/login_screen.dart';
import 'package:mytradeasia/view/auth/register/register_screen.dart';
import 'package:mytradeasia/view/menu/other/navigation_bar.dart';
import 'package:mytradeasia/view/menu/other/splash_page.dart';

class Routes {
  GoRouter router =
      GoRouter(initialLocation: "/", debugLogDiagnostics: true, routes: [
    GoRoute(
        path: "/",
        builder: (context, state) => const SplashScreen(),
        redirect: (context, state) => '/'),
    GoRoute(
        path: "/home",
        builder: (context, state) => const NavigationBarWidget()),
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
