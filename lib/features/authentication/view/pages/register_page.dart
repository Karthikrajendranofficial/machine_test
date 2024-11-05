import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:machine_test_karthik/features/authentication/controller/auth_controller.dart';
import 'package:machine_test_karthik/features/authentication/view/pages/login_page.dart';
import 'package:machine_test_karthik/core/widgets/text_field_widget.dart';

class RegisterPage extends HookConsumerWidget {
  static const routePath = "/register";

  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context, ref) {
    /// Controllers for the email and password fields
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();

    /// Key used to validate the form
    final formKey = useMemoized(() => GlobalKey<FormState>());

    /// Indicate if the signup process is loading
    final isLoading = useState(false);

    /// Callback to execute when the register button is pressed
    void onRegisterPressed() {
      isLoading.value = true;

      /// Get the email and password from the controllers
      final email = emailController.text;
      final password = passwordController.text;

      if (formKey.currentState!.validate()) {
        ref
            .read(authControllerProvider.notifier)
            .signUpWithEmailAndPassword(email, password);
      }

      isLoading.value = false;
    }

    /// A callback to execute when the login link is pressed
    void onLoginLinkPressed() {
      context.go(LoginPage.routePath);
    }

    return Scaffold(
      backgroundColor: Colors.black,
      body: Form(
        key: formKey,
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset("assets/images/logo.png"),
                  TextFieldWidget(
                    label: "Email",
                    inputType: TextInputType.emailAddress,
                    action: TextInputAction.next,
                    controller: emailController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Email is required";
                      }

                      return null;
                    },
                  ),
                  const SizedBox(height: 8),
                  TextFieldWidget(
                    label: "Password",
                    obscureText: true,
                    action: TextInputAction.next,
                    controller: passwordController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Password is required";
                      }

                      return null;
                    },
                  ),
                  const SizedBox(height: 8),
                  TextFieldWidget(
                    label: "Confirm Password",
                    obscureText: true,
                    action: TextInputAction.done,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Confirm Password is required";
                      }
                      if (value != passwordController.text) {
                        return "Password does not match";
                      }
                      return null;
                    },
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
      ),
    );
  }
}
