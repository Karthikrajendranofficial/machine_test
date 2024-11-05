import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:machine_test_karthik/features/authentication/controller/auth_controller.dart';
import 'package:machine_test_karthik/features/authentication/view/pages/register_page.dart';
import 'package:machine_test_karthik/core/widgets/text_field_widget.dart';

class LoginPage extends HookConsumerWidget {
  static const routePath = "/login";

  const LoginPage({super.key});

  @override
  Widget build(BuildContext context, ref) {
    /// State to indicate if the login process is loading
    final isLoading = useState(false);

    /// Controllers used to get the email and password
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();

    /// Callback to execute when the login button is pressed
    void onLoginPressed() async {
      isLoading.value = true;

      final email = emailController.text;
      final password = passwordController.text;

      ref
          .read(authControllerProvider.notifier)
          .loginWithEmailAndPassword(email, password);

      isLoading.value = false;
    }

    /// A callback to execute when the register link is pressed
    void onRegisterLinkPressed() {
      context.go(RegisterPage.routePath);
    }

    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/images/logo.png"),
              TextFieldWidget(
                controller: emailController,
                label: "Email",
                inputType: TextInputType.emailAddress,
                action: TextInputAction.next,
              ),
              const SizedBox(height: 8),
              TextFieldWidget(
                controller: passwordController,
                label: "Password",
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
                  onPressed: onLoginPressed, // Call the login handler
                  child: const Text(
                    "Login",
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
                  const Text(
                    'Do not have an account?',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  TextButton(
                      onPressed: onRegisterLinkPressed,
                      child: const Text('Register'))
                ],
              ),
              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }
}
