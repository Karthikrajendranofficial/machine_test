import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:machine_test_karthik/core/router/router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await GetStorage.init();

  runApp(const App());
}

class App extends StatelessWidget {
  static final scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();
  static final navigatorKey = GlobalKey<NavigatorState>();

  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      scaffoldMessengerKey: scaffoldMessengerKey,
    );
  }
}
