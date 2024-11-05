import 'package:flutter/material.dart';
import 'package:machine_test_karthik/main.dart';

class SnackbarUtils {
  static void showMessage(String message) {
    App.scaffoldMessengerKey.currentState?.showSnackBar(
      SnackBar(content: Text(message)),
    );
  }
}
