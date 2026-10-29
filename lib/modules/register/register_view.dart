import 'package:demo_access_refresh_token_app/modules/register/register_controller.dart';
import 'package:demo_access_refresh_token_app/widgets/auth_ui_components.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterView extends GetView<RegisterController> {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return AuthBackground(
        child: Column(
          children: [
            const Spacer(),
            Container(
              height: MediaQuery.of(context).size.height * 0.85,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
              ),
              padding: const EdgeInsets.only(
                top: 30,
                left: 24,
                right: 24,
                bottom: 20,
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const Text(
                      "Get Started",
                      style: TextStyle(
                        color: AuthColors.primaryTeal,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 25),
                    CustomAuthInput(
                      label: "Username",
                      hint: "Enter Username",
                      controller: controller.usernameController.value,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: CustomAuthInput(
                            label: "First Name",
                            hint: "First",
                            controller: controller.firstNameController.value,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: CustomAuthInput(
                            label: "Last Name",
                            hint: "Last",
                            controller: controller.lastNameController.value,
                          ),
                        ),
                      ],
                    ),
                    CustomAuthInput(
                      label: "Email",
                      hint: "Enter Email",
                      controller: controller.emailController.value,
                    ),
                    CustomAuthInput(
                      label: "Phone",
                      hint: "Enter Phone",
                      controller: controller.phoneNumberController.value,
                    ),
                    CustomAuthInput(
                      label: "Password",
                      hint: "Enter Password",
                      isPassword: true,
                      controller: controller.passwordController.value,
                    ),
                    CustomAuthInput(
                      label: "Confirm Password",
                      hint: "Confirm Password",
                      isPassword: true,
                      controller: controller.confirmPasswordController.value,
                    ),

                    Row(
                      children: [
                        const Icon(
                          Icons.check_circle,
                          color: AuthColors.primaryTeal,
                          size: 20,
                        ),
                        const SizedBox(width: 8),
                        const Text(
                          "I agree to the processing of ",
                          style: TextStyle(fontSize: 12),
                        ),
                        const Text(
                          "personal data",
                          style: TextStyle(
                            color: AuthColors.primaryTeal,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),

                    CustomAuthButton(
                      title: "Sign up",
                      isLoading: controller.isLoading.value,
                      onTap: () {
                        FocusScope.of(context).unfocus();
                        controller.onRegister();
                      },
                    ),

                    const SizedBox(height: 20),
                    const Row(
                      children: [
                        Expanded(child: Divider()),

                        Expanded(child: Divider()),
                      ],
                    ),
                    const SizedBox(height: 15),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Already have an account? ",
                          style: TextStyle(color: AuthColors.greyText),
                        ),
                        GestureDetector(
                          onTap: () => Get.back(),
                          child: const Text(
                            "Sign in",
                            style: TextStyle(
                              color: AuthColors.primaryTeal,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}
