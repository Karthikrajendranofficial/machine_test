import 'package:firebase_auth/firebase_auth.dart';
import 'package:machine_test_karthik/core/utils/snackbar_utils.dart';
import 'package:machine_test_karthik/features/authentication/services/auth_services.dart';
import 'package:machine_test_karthik/main.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:go_router/go_router.dart';

part 'auth_controller.g.dart';

@riverpod
class AuthController extends _$AuthController {
  @override
  void build() {}

  Future<void> loginWithEmailAndPassword(String email, String password) async {
    try {
      await AuthServices.signInWithEmailAndPassword(email, password);

      App.navigatorKey.currentContext!.go()

      SnackbarUtils.showMessage('Login Successful');
    } on FirebaseAuthException catch (e) {
      SnackbarUtils.showMessage(e.message ?? '');
    } catch (e) {
      SnackbarUtils.showMessage('Login Failed. Try again');
    }
  }

  Future<void> signUpWithEmailAndPassword(String email, String password) async {
    try {
      await AuthServices.signUpWithEmailAndPassword(email, password);

      SnackbarUtils.showMessage('Sign Up Successful');
    } on FirebaseAuthException catch (e) {
      SnackbarUtils.showMessage(e.message ?? '');
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
