import 'package:demo_access_refresh_token_app/core/services/api_service.dart';
import 'package:demo_access_refresh_token_app/modules/register/register_controller.dart';
import 'package:get/get.dart';

class RegisterBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(()=> RegisterController(
        apiService: Get.find<ApiService>()
    ));
  }
}