import 'package:firebase_auth/firebase_auth.dart';

class AuthServices {
  static Future<void> signInWithEmailAndPassword(
      String email, String password) async {
    FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
  }

  static Future<void> signUpWithEmailAndPassword(
      String email, String password) async {
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
  }

  static Future<void> signOut() async {
    FirebaseAuth.instance.signOut();
  }
}
