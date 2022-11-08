import 'package:synema_sync/Modular/Auth/Controllers/auth_controller.dart';
import 'package:synema_sync/Modular/Projects/Controller/mediagrid_controller.dart';
import 'package:synema_sync/Modular/Projects/Models/project_list.dart';
import 'package:synema_sync/Modular/Projects/Services/project_api.dart';
import 'package:synema_sync/View/Widgets/loading/loading.dart';
import 'package:synema_sync/list_treeview/list_treeview.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:flutter/material.dart';

class ProjectController extends GetxController {
  AuthController authController = Get.find();
  TreeViewController treeController =  TreeViewController();
  MediaGridController gridController = Get.find();
  ProjectListModel? projects;
  ShootsAndEditsListModel? shootsAndEdits;
  final box = GetStorage();

  bool homeScreen = false;
  bool homeScreenEmpity = false;

  loadProjests() async {
    print("ProjectController loadProjests");
    homeScreen = false;
    update();
    showLoading();
    projects = await ProjectApi().loadProjectsAPI();
    update();
    stopLoading();
    if (projects?.status == 200) {
      print("ProjectController 200 ${projects?.items?.length}");
      treeController.treeData(projects?.items);
    } else if (projects!.status == 204) {
      print("Empty");
    } else if (projects!.status == 404) {
      homeScreen = true;
      update();
    } else if (projects!.status == 401) {
      authController.logout();
    } else {
      print("someting wrong 400");
      authController.logout();
    }
  }

  loadProjestWithID(ProjectModel item ) async {
    print("ProjectController loadProjestWithID ${item.id} level  ${item.level}  MEDIA ${item.mediaFiles.length}");
    if( item.level ==3){
      print("ProjectController MEDIA ${item.id} level  ${item.mediaFiles.length}");
      gridController.changeMediaFolder(item);
    }
    if(item.children.length > 0 || item.id! < 0 || item.level >1){
      return;
    }

    /*

     */
    homeScreen = false;
    update();
    showLoading();
    shootsAndEdits =  await ProjectApi().loadProjectIDAPI(item);
    update();
    stopLoading();
    if (shootsAndEdits?.status == 200) {
      print("ProjectController 200 SHOOTS ${shootsAndEdits?.shoots?.length} EDITS ${shootsAndEdits?.edits?.length}");

      var shoots = ProjectModel(title: 'shoots', id:-1, icon:Icons.videocam_rounded);
      var edits = ProjectModel(title: 'edits', id:-2, icon:Icons.live_tv_outlined);

      shootsAndEdits?.shoots?.forEach((shoot){
        shoot.icon = Icons.folder;
        treeController.insertAtFront(shoots, shoot);
      });
      shootsAndEdits?.edits?.forEach((edit){
        edit.icon = Icons.folder;
        treeController.insertAtFront(edits, edit);
      });


      treeController.insertAtFront(item, shoots);
      treeController.insertAtFront(item, edits);

    } else if (shootsAndEdits!.status == 204) {
      print("Empty");
    } else if (shootsAndEdits!.status == 404) {
      homeScreen = true;
      update();
    } else if (shootsAndEdits!.status == 401) {
      authController.logout();
    } else {
      print("someting wrong 400");
      authController.logout();
    }
  }
}
