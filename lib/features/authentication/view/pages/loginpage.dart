import 'package:flutter/material.dart';
import 'package:machine_test_karthik/features/authentication/view/widgets/textfield_widget.dart';
import 'package:machine_test_karthik/features/weather/controller/geolocation_controller.dart';
import 'package:machine_test_karthik/features/weather/view/pages/homepage.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
              "images/Modern-logo-design-template-on-transparent-PNG.png"),
          TextfieldWidget(
            label: "Phone Number",
          ),
          const SizedBox(height: 8),
          TextfieldWidget(
            label: "Password",
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
            ),
            onPressed: () =>
                Navigator.push(context, MaterialPageRoute(builder: (context) {
              determinePosition();
              return const HomePage();
            })), // Call the login handler
            child: const Text(
              "Login",
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
          )
        ],
      ),
    );
  }
}
