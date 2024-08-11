import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

class LoginController extends GetxController {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  var isPasswordVisible = false.obs;
  var isLoading = false.obs;
  final _storage = FlutterSecureStorage();

  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  bool _validateInputs() {
    if (usernameController.text.isEmpty) {
      Get.snackbar("Error", "Username is required", backgroundColor: Colors.red, colorText: Colors.white);
      return false;
    }
    if (passwordController.text.isEmpty) {
      Get.snackbar("Error", "Password is required", backgroundColor: Colors.red, colorText: Colors.white);
      return false;
    }
    return true;
  }

  Future<void> login() async {
    if (!_validateInputs()) return;

    isLoading.value = true;

    final url = Uri.parse('https://api.accounts.vikncodes.com/api/v1/users/login');
    final headers = {'Content-Type': 'application/json'};
    final body = jsonEncode({
      "username": usernameController.text,
      "password": passwordController.text,
      "is_mobile": true,
    });

    try {
      final response = await http.post(url, headers: headers, body: body);
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        await _storage.write(key: 'token', value: data['token']);
        await _storage.write(key: 'userID', value: data['userID'].toString());

        Get.offNamed('/bottom');
      } else {
        Get.snackbar("Login Failed", "Invalid credentials or server error", backgroundColor: Colors.red, colorText: Colors.white);
      }
    } catch (e) {
      Get.snackbar("Error", "Failed to authenticate. Please try again.", backgroundColor: Colors.red, colorText: Colors.white);
    } finally {
      isLoading.value = false;
    }
  }
}
