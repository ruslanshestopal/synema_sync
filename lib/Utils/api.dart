import 'package:synema_sync/Modular/Auth/Controllers/auth_controller.dart';
import 'package:get/get.dart';

class SharedApi {
  String imageUrl = "";
  String baseUrl = "https://dashboard.videotechsolutions.co/mobile_api/";



  Map<String, String> getToken() {

    AuthController authController = Get.find();
    String? token = authController.user!.token;

    print('SharedApi:getToken $token');

    if (token != null)
      return {
        "Auth-token": token,
      };
    return {
      "Auth-token": "BadToken",
    };
  }
}
