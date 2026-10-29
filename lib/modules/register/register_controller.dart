import 'package:demo_access_refresh_token_app/models/register/RegisterRequest.dart';
import 'package:demo_access_refresh_token_app/routes/app_route_name.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/services/api_service.dart';

class RegisterController extends GetxController {
  final ApiService apiService;
  RegisterController({required this.apiService});

  var usernameController = TextEditingController().obs;
  var firstNameController = TextEditingController().obs;
  var lastNameController = TextEditingController().obs;
  var emailController = TextEditingController().obs;
  var phoneNumberController = TextEditingController().obs;
  var passwordController = TextEditingController().obs;
  var confirmPasswordController = TextEditingController().obs;

  var isLoading = false.obs;

  void onRegister() async {
    String username = usernameController.value.text.trim();
    String firstName = firstNameController.value.text.trim();
    String lastName = lastNameController.value.text.trim();
    String email = emailController.value.text.trim();
    String phoneNumber = phoneNumberController.value.text.trim();
    String password = passwordController.value.text.trim();
    String confirmPassword = confirmPasswordController.value.text.trim();

    if (username.isEmpty || password.isEmpty || confirmPassword.isEmpty) {
      Get.snackbar(
        "Error",
        "Please fill required fields",
        backgroundColor: Colors.redAccent,
        colorText: Colors.white,
      );
      return;
    }

    if (password != confirmPassword) {
      Get.snackbar(
        "Error",
        "Passwords do not match",
        backgroundColor: Colors.redAccent,
        colorText: Colors.white,
      );
      return;
    }

    isLoading.value = true;

    var request = RegisterRequest(
      username: username,
      firstName: firstName,
      lastName: lastName,
      email: email,
      phoneNumber: phoneNumber,
      password: password,
      confirmPassword: confirmPassword,
      role: "USER",
      profile: "",
    );

    try {
      var response = await apiService.register(body: request);

      if (response.code == "200" || response.message == "Create Success") {
        Get.snackbar(
          "Success",
          response.data ?? "Register Successfully",
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );
        Get.offNamed(AppRouteName.login);
      } else {
        Get.snackbar(
          "Error",
          response.message ?? "Register Unsuccessfully",
          backgroundColor: Colors.redAccent,
          colorText: Colors.white,
        );
      }
    } catch (e) {
      Get.snackbar(
        "Error",
        "Failed to connect to server",
        backgroundColor: Colors.redAccent,
        colorText: Colors.white,
      );
    }

    isLoading.value = false;
  }
}
