import 'package:demo_access_refresh_token_app/modules/login/login_controller.dart';
import 'package:demo_access_refresh_token_app/widgets/auth_ui_components.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return AuthBackground(
        child: Center(
          child: SingleChildScrollView(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.1),
                    blurRadius: 20,
                    offset: const Offset(0, 10),
                  )
                ],
              ),
              padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 24),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    "Welcome Back",
                    style: TextStyle(
                      color: AuthColors.primaryTeal,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 30),
                  CustomAuthInput(
                    label: "Phone Number",
                    hint: "Enter Phone Number",
                    controller: controller.usernameController.value,
                  ),
                  CustomAuthInput(
                    label: "Password",
                    hint: "Enter Password",
                    isPassword: true,
                    controller: controller.passwordController.value,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.check_circle, color: AuthColors.primaryTeal, size: 20),
                          const SizedBox(width: 5),
                          const Text("Remember me", style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                        ],
                      ),
                      const Text("Forgot Password?", style: TextStyle(color: AuthColors.primaryTeal, fontSize: 12, fontWeight: FontWeight.bold)),
                    ],
                  ),
                  const SizedBox(height: 30),
                  CustomAuthButton(
                    title: "Sign in",
                    isLoading: controller.isLoading.value,
                    onTap: () {
                      FocusScope.of(context).unfocus();
                      controller.onLogin();
                    },
                  ),
                  const SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Don't have an account? ", style: TextStyle(color: AuthColors.greyText)),
                      GestureDetector(
                        onTap: controller.goToRegister,
                        child: const Text("Sign up", style: TextStyle(color: AuthColors.primaryTeal, fontWeight: FontWeight.bold)),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}