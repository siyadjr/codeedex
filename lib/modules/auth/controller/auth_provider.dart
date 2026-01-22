import 'dart:developer';

import 'package:codeedex/servieces/backend_servieces.dart';
import 'package:codeedex/servieces/local_storage_service.dart';
import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  final BackendServices _backendServices = BackendServices();
  final LocalStorageService _localStorageService = LocalStorageService();

  bool isLoading = false;
  bool validated = false;
  String? errorMessage;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<bool> login() async {
    validated = _validate();

    if (!validated) {
      errorMessage = 'Please enter email and password';
      notifyListeners();
      return false;
    }

    try {
      isLoading = true;
      errorMessage = null;
      notifyListeners();

      final response = await _backendServices.login(
        emailOrPhone: emailController.text,
        password: passwordController.text,
      );

      if (response.statusCode == 200 && response.data['success'] == 1) {
        // Extract required values
        log('Login successful: ${response.data}');
        final String token = response.data['customerdata']['token'];
        log('token is $token');
        await _localStorageService.saveToken(token);

        return true;
      } else {
        log('Login not worked: ${response.data}');
        errorMessage = response.data['message'] ?? 'Login failed';
        log('Login failed: ${response.data}');
        return false;
      }
    } catch (e) {
      log('Login error: $e');
      errorMessage = 'Login failed';
      return false;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  bool _validate() {
    return emailController.text.isNotEmpty &&
        passwordController.text.isNotEmpty;
  }
}
