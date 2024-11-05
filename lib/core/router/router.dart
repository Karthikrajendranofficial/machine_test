import 'package:firebase_auth/firebase_auth.dart';
import 'package:go_router/go_router.dart';
import 'package:machine_test_karthik/features/authentication/view/pages/login_page.dart';
import 'package:machine_test_karthik/features/authentication/view/pages/register_page.dart';
import 'package:machine_test_karthik/features/weather/view/pages/weather_page.dart';
import 'package:machine_test_karthik/main.dart';

final router = GoRouter(
  navigatorKey: App.navigatorKey,
  initialLocation: LoginPage.routePath,
  routes: [
    GoRoute(
      path: LoginPage.routePath,
      builder: (context, state) => const LoginPage(),
      redirect: (context, state) {
        if (FirebaseAuth.instance.currentUser != null) {
          return HomePage.routePath;
        }

        return null;
      },
    ),
    GoRoute(
      path: RegisterPage.routePath,
      builder: (context, state) => const RegisterPage(),
    ),
    GoRoute(
      path: HomePage.routePath,
      builder: (context, state) => const HomePage(),
    ),
  ],
);
