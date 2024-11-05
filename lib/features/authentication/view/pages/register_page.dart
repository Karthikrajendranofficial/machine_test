import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:machine_test_karthik/features/authentication/view/pages/login_page.dart';
import 'package:machine_test_karthik/core/widgets/text_field_widget.dart';

class RegisterPage extends StatelessWidget {
  static const routePath = "/register";

  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    /// Callback to execute when the register button is pressed
    void onRegisterPressed() {}

    /// A callback to execute when the login link is pressed
    void onLoginLinkPressed() {
      context.go(LoginPage.routePath);
    }

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("assets/images/logo.png"),
                const TextFieldWidget(
                  label: "Email",
                  inputType: TextInputType.emailAddress,
                  action: TextInputAction.next,
                ),
                const SizedBox(height: 8),
                const TextFieldWidget(
                  label: "Password",
                  obscureText: true,
                  action: TextInputAction.next,
                ),
                const SizedBox(height: 8),
                const TextFieldWidget(
                  label: "Confirm Password",
                  obscureText: true,
                  action: TextInputAction.done,
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                    ),
                    onPressed: onRegisterPressed, // Call the register handler
                    child: const Text(
                      "Register",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Already have an account?',
                        style: TextStyle(color: Colors.white)),
                    TextButton(
                        onPressed: onLoginLinkPressed,
                        child: const Text('Login'))
                  ],
                ),
                const SizedBox(height: 32),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
