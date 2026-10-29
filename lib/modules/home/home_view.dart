import 'package:demo_access_refresh_token_app/data/local/token_store_local.dart';
import 'package:demo_access_refresh_token_app/modules/home/home_controller.dart';
import 'package:demo_access_refresh_token_app/routes/app_route_name.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    const Color primaryColor = Color(0xFF0D7E9D);
    const Color bgColor = Color(0xFFF5F7FA);

    return Obx(() {
      return Scaffold(
        backgroundColor: bgColor,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: primaryColor,
          iconTheme: const IconThemeData(color: Colors.white),
          centerTitle: true,
          title: Text(
            "home".tr,
            style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          actions: [
            IconButton(
              tooltip: 'Change Language',
              onPressed: () {
                if (Get.locale!.languageCode == "km") {
                  Get.updateLocale(const Locale('en', 'US'));
                } else {
                  Get.updateLocale(const Locale('km', 'KH'));
                }
              },
              icon: const Icon(Icons.language),
            ),
            IconButton(
              tooltip: 'Logout',
              onPressed: () {
                TokenStoreLocal.removeToken();
                Get.offAllNamed(AppRouteName.welcome);
              },
              icon: const Icon(Icons.logout_rounded),
            )
          ],
        ),
        drawer: Drawer(
          backgroundColor: Colors.white,
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              const UserAccountsDrawerHeader(
                decoration: BoxDecoration(
                  color: primaryColor,
                ),
                accountName: Text(
                  "Welcome User",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                accountEmail: Text("Manage your application"),
                currentAccountPicture: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Icon(Icons.person, size: 40, color: primaryColor),
                ),
              ),
              const SizedBox(height: 10),

              // --- POSTS SECTION ---
              ExpansionTile(
                leading: const Icon(Icons.article, color: primaryColor),
                title: const Text("Posts", style: TextStyle(fontWeight: FontWeight.w600)),
                children: [
                  ListTile(
                    contentPadding: const EdgeInsets.only(left: 50, right: 24),
                    title: const Text("Public Posts"),
                    trailing: const Icon(Icons.public, color: Colors.grey, size: 16),
                    onTap: () {
                      Navigator.pop(context);
                      // TODO: Add route for Public Posts
                    },
                  ),
                  ListTile(
                    contentPadding: const EdgeInsets.only(left: 50, right: 24),
                    title: const Text("Manage Posts (Auth)"),
                    trailing: const Icon(Icons.edit_document, color: Colors.grey, size: 16),
                    onTap: () {
                      Navigator.pop(context);
                      Get.toNamed(AppRouteName.adminPost);
                    },
                  ),
                ],
              ),

              // --- CATEGORIES SECTION ---
              ExpansionTile(
                leading: const Icon(Icons.category, color: primaryColor),
                title: const Text("Categories", style: TextStyle(fontWeight: FontWeight.w600)),
                children: [
                  ListTile(
                    contentPadding: const EdgeInsets.only(left: 50, right: 24),
                    title: const Text("Public Categories"),
                    trailing: const Icon(Icons.public, color: Colors.grey, size: 16),
                    onTap: () {},
                  ),
                  ListTile(
                    contentPadding: const EdgeInsets.only(left: 50, right: 24),
                    title: const Text("Manage Categories (Auth)"),
                    trailing: const Icon(Icons.edit_document, color: Colors.grey, size: 16),
                    onTap: () {},
                  ),
                ],
              ),

              // --- HOTELS SECTION ---
              ExpansionTile(
                leading: const Icon(Icons.hotel, color: primaryColor),
                title: const Text("Hotels", style: TextStyle(fontWeight: FontWeight.w600)),
                children: [
                  ListTile(
                    contentPadding: const EdgeInsets.only(left: 50, right: 24),
                    title: const Text("Public Hotels"),
                    trailing: const Icon(Icons.public, color: Colors.grey, size: 16),
                    onTap: () {},
                  ),
                  ListTile(
                    contentPadding: const EdgeInsets.only(left: 50, right: 24),
                    title: const Text("Admin Hotels"),
                    trailing: const Icon(Icons.admin_panel_settings, color: Colors.grey, size: 16),
                    onTap: () {},
                  ),
                ],
              ),

              // --- PRODUCTS SECTION ---
              ListTile(
                contentPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 0),
                leading: const Icon(Icons.shopping_bag, color: primaryColor),
                title: const Text("Products", style: TextStyle(fontWeight: FontWeight.w600)),
                trailing: const Icon(Icons.arrow_forward_ios, color: Colors.grey, size: 16),
                onTap: () {},
              ),

              // --- USER MANAGEMENT SECTION ---
              ListTile(
                contentPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 0),
                leading: const Icon(Icons.manage_accounts, color: primaryColor),
                title: const Text("User Management", style: TextStyle(fontWeight: FontWeight.w600)),
                trailing: const Icon(Icons.admin_panel_settings, color: Colors.grey, size: 16),
                onTap: () {},
              ),

              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: Divider(height: 30),
              ),
            ],
          ),
        ),

        body: controller.loading.value
            ? const Center(
          child: CircularProgressIndicator(color: primaryColor),
        )
            : Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.dashboard_customize_rounded,
                size: 100,
                color: primaryColor.withValues(alpha: 0.2),
              ),
              const SizedBox(height: 20),
              Text(
                "Welcome to ${"home".tr}",
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                "Open the side menu to view and manage data.",
                style: TextStyle(color: Colors.grey, fontSize: 16),
              ),
            ],
          ),
        ),
      );
    });
  }
}