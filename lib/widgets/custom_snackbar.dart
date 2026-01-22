import 'package:flutter/material.dart';

class CustomSnackBar {
  static SnackBar error(String? message) {
    return SnackBar(
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.red.shade600,
      content: Text(
        message ?? 'Login failed... Please try again.',
        textAlign: TextAlign.center,
      ),
    );
  }
}
