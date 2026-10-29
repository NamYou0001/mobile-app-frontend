import 'package:flutter/material.dart';

class AuthColors {
  static const Color darkTeal = Color(0xFF023E54);
  static const Color primaryTeal = Color(0xFF0D7E9D);
  static const Color lightBlue = Color(0xFFC0E5F0);
  static const Color greyText = Color(0xFF9E9E9E);
}

class AuthBackground extends StatelessWidget {
  final Widget child;
  const AuthBackground({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFFC0E5F0), Color(0xFF023E54)],
          ),
        ),
        child: Stack(
          children: [
            // Simulating the blob shapes from the design image
            Positioned(
              top: -50,
              left: -50,
              child: Container(
                width: 250,
                height: 250,
                decoration: BoxDecoration(
                  color: AuthColors.primaryTeal.withValues(alpha: 0.8),
                  shape: BoxShape.circle,
                ),
              ),
            ),
            Positioned(
              top: 150,
              right: -100,
              child: Container(
                width: 300,
                height: 300,
                decoration: BoxDecoration(
                  color: AuthColors.darkTeal.withValues(alpha: 0.9),
                  shape: BoxShape.circle,
                ),
              ),
            ),
            Positioned(
              bottom: -50,
              left: -50,
              child: Container(
                width: 200,
                height: 200,
                decoration: const BoxDecoration(
                  color: AuthColors.primaryTeal,
                  shape: BoxShape.circle,
                ),
              ),
            ),
            // The actual page content
            SafeArea(bottom: false, child: child),
          ],
        ),
      ),
    );
  }
}

class CustomAuthInput extends StatelessWidget {
  final String label;
  final String hint;
  final bool isPassword;
  final TextEditingController controller;

  const CustomAuthInput({
    super.key,
    required this.label,
    required this.hint,
    required this.controller,
    this.isPassword = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
              color: AuthColors.primaryTeal,
              fontWeight: FontWeight.bold,
              fontSize: 12,
            ),
          ),
          const SizedBox(height: 5),
          TextField(
            controller: controller,
            obscureText: isPassword,
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: const TextStyle(
                color: AuthColors.greyText,
                fontSize: 14,
              ),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 16,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: const BorderSide(color: Color(0xFFE0E0E0)),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: const BorderSide(
                  color: AuthColors.primaryTeal,
                  width: 2,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CustomAuthButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final bool isSolid;
  final bool isLoading;

  const CustomAuthButton({
    super.key,
    required this.title,
    required this.onTap,
    this.isSolid = true,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isLoading ? null : onTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          color: isSolid ? AuthColors.primaryTeal : Colors.white,
          borderRadius: BorderRadius.circular(30),
          border: isSolid
              ? null
              : Border.all(color: AuthColors.primaryTeal, width: 2),
          boxShadow: [
            if (isSolid)
              BoxShadow(
                color: AuthColors.primaryTeal.withValues(alpha: 0.3),
                blurRadius: 10,
                offset: const Offset(0, 5),
              ),
          ],
        ),
        child: Center(
          child: isLoading
              ? const SizedBox(
            height: 20,
            width: 20,
            child: CircularProgressIndicator(
              color: Colors.white,
              strokeWidth: 2,
            ),
          )
              : Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                style: TextStyle(
                  color: isSolid ? Colors.white : AuthColors.primaryTeal,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              const SizedBox(width: 8),
              Icon(
                Icons.arrow_forward,
                color: isSolid ? Colors.white : AuthColors.primaryTeal,
                size: 18,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SocialIconsRow extends StatelessWidget {
  const SocialIconsRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildIcon("G", Colors.red),
        const SizedBox(width: 15),
        _buildIcon("f", Colors.blue),
        const SizedBox(width: 15),
        _buildIcon("t", Colors.lightBlue),
      ],
    );
  }

  Widget _buildIcon(String letter, Color color) {
    return Container(
      height: 40,
      width: 40,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Center(
        child: Text(
          letter,
          style: TextStyle(color: color, fontWeight: FontWeight.bold, fontSize: 18),
        ),
      ),
    );
  }
}