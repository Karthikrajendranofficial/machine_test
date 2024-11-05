import 'package:machine_test_karthik/core/utils/snackbar_utils.dart';
import 'package:machine_test_karthik/features/authentication/services/auth_services.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_controller.g.dart';

@riverpod
class AuthController extends _$AuthController {
  @override
  void build() {}

  Future<void> loginWithEmailAndPassword(String email, String password) async {
    try {
      await AuthServices.signInWithEmailAndPassword(email, password);

      SnackbarUtils.showMessage('Login Successful');
    } catch (e) {
      SnackbarUtils.showMessage('Login Failed. Try again');
    }
  }

  Future<void> signUpWithEmailAndPassword(String email, String password) async {
    try {
      await AuthServices.signUpWithEmailAndPassword(email, password);

      SnackbarUtils.showMessage('Sign Up Successful');
    } catch (e) {
      SnackbarUtils.showMessage('Sign Up Failed. Try again');
    }
  }

  Future<void> signOut() async {
    try {
      await AuthServices.signOut();

      SnackbarUtils.showMessage('Sign Out Successful');
    } catch (e) {
      SnackbarUtils.showMessage('Sign Out Failed. Try again');
    }
  }
}
