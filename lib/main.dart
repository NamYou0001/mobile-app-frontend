import 'package:demo_access_refresh_token_app/binding/initial_binding.dart';
import 'package:demo_access_refresh_token_app/routes/app_route.dart';
import 'package:demo_access_refresh_token_app/routes/app_route_name.dart';
import 'package:demo_access_refresh_token_app/translations/messages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

Future<void> main() async {
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      translations: Messages(),
      locale: const Locale('km', 'KH'),
      fallbackLocale: const Locale('en', 'UK'),
      theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange)),
      initialRoute: AppRouteName.splash,
      initialBinding: InitialBinding(),
      getPages: AppRoute.getAllRoutes(),
      debugShowCheckedModeBanner: false,
    );
  }
}