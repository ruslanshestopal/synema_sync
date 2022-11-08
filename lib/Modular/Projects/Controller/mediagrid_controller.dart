import 'package:get/get.dart';
import 'package:synema_sync/Modular/Projects/Models/project_list.dart';
import 'project_controller.dart';

class MediaGridController extends GetxController{
 //AuthController authController = Get.find();
  // List<Map> mediaFiles =[];
  /*
  List.generate(8, (index) => {"id": index, "name": "Product $index"})
      .toList();
*/
  List<MediaFileModel> mediaFiles =[];
  ProjectModel? selectedItem;
  MediaFileModel? selectedMedia;
  //int n =2;

 void changeMediaFolder( ProjectModel item){
   mediaFiles = item.mediaFiles;
   selectedItem = item;
   print(item.title);
   update();
 }
  void selectMedia( MediaFileModel item){

    mediaFiles.forEach((MediaFileModel mediaItem) {
      mediaItem.isSelected = false;
    });

    item.isSelected = true;
    selectedMedia = item;
    print(item.title);
    update();
  }

}