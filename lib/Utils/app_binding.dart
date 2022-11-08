import 'package:synema_sync/Modular/Auth/Controllers/auth_controller.dart';
import 'package:synema_sync/Modular/Projects/Controller/mediagrid_controller.dart';
import 'package:synema_sync/Modular/Projects/Controller/project_controller.dart';
import 'package:synema_sync/list_treeview/list_treeview.dart';
import 'package:get/get.dart';




class AppBinding implements Bindings{
  @override
  void dependencies() {
    print('AppBinding');
    Get.put<AuthController>(AuthController());
    Get.put<MediaGridController>(MediaGridController());
    Get.put<ProjectController>(ProjectController());
    Get.put<TreeViewController>(TreeViewController());
  }

}