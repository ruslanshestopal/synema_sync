import 'dart:convert';
import 'package:synema_sync/Modular/Projects/Models/project_list.dart';
import 'package:synema_sync/Utils/api.dart';
import 'package:http/http.dart' as http;

class ProjectApi extends SharedApi {
  // Load All Reivews API
  Future<ProjectListModel> loadProjectsAPI() async {
    print("loadProjectsAPI loadProjests");
    try {
      print(getToken());
      var data = await http.get(Uri.parse(baseUrl + 'projects?limit=30'), headers: getToken());
      if (data.statusCode == 200) {
        var jsonData = json.decode(data.body);
        return ProjectListModel.fromJson(
            {"status": 200, "items": jsonData['data']});
      } else {
        return ProjectListModel.fromJson(
            {"status": data.statusCode, "items": []});
      }
    } on Exception catch (_) {
      return ProjectListModel.fromJson({"status": 404, "items": []});
    }
  }

  Future loadProjectIDAPI(ProjectModel item) async {
    print("loadProjectsAPI loadProjests");
    try {
     // print(getToken());
      var data = await http.get(Uri.parse(baseUrl + 'projects/'+'${item.id}'), headers: getToken());
      if (data.statusCode == 200) {
        var jsonData = json.decode(data.body);
        //print(jsonData);
        if(jsonData['success'] == true){
        //  print("success OK ${jsonData['data']['shoots']}");

          return ShootsAndEditsListModel.fromJson(
              {"status": 200, "items": jsonData['data']});

        }

      } else {
        /*
        return ProjectListModel.fromJson(
            {"status": data.statusCode, "items": []});


         */
      }
      return ProjectListModel.fromJson(
          {"status": 200, "items": []});

    } on Exception catch (_) {
      return ProjectListModel.fromJson({"status": 404, "items": []});
    }
  }
}
