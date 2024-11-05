import 'package:go_router/go_router.dart';
import 'package:machine_test_karthik/features/authentication/view/pages/login_page.dart';
import 'package:machine_test_karthik/features/authentication/view/pages/register_page.dart';
import 'package:machine_test_karthik/main.dart';

final router = GoRouter(
  navigatorKey: App.navigatorKey,
  initialLocation: LoginPage.routePath,
  routes: [
    GoRoute(
      path: LoginPage.routePath,
      builder: (context, state) => const LoginPage(),
    ),
    GoRoute(
      path: RegisterPage.routePath,
      builder: (context, state) => const RegisterPage(),
    ),
  ],
);
