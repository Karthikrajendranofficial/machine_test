import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:machine_test_karthik/features/authentication/view/pages/register_page.dart';
import 'package:machine_test_karthik/features/authentication/view/widgets/textfield_widget.dart';

class LoginPage extends StatelessWidget {
  static const routePath = "/login";

  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    /// Callback to execute when the login button is pressed
    void onLoginPressed() {}

    /// A callback to execute when the register link is pressed
    void onRegisterLinkPressed() {
      context.pushReplacement(RegisterPage.routePath);
    }

    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset("assets/images/logo.png"),
          const TextfieldWidget(
            label: "Email",
            inputType: TextInputType.emailAddress,
            action: TextInputAction.next,
          ),
          const SizedBox(height: 8),
          const TextfieldWidget(
            label: "Password",
            obscureText: true,
            action: TextInputAction.done,
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
            ),
            onPressed: onLoginPressed, // Call the login handler
            child: const Text(
              "Login",
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Do not have an account?'),
              TextButton(
                  onPressed: onRegisterLinkPressed,
                  child: const Text('Register'))
            ],
          ),
          const SizedBox(height: 32),
        ],
      ),
    );
  }
}
