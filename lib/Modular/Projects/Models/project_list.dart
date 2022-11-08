import 'package:flutter/material.dart';
import 'package:synema_sync/list_treeview/list_treeview.dart';

class ProjectModel extends NodeData {

  ProjectModel({this.id,this.title, this.icon= Icons.folder_copy_rounded }) : super();

  final int? id;
  final String? title;
  IconData? icon;
  List<MediaFileModel> mediaFiles =[];

  factory ProjectModel.fromJson(Map<String, dynamic> jsonData) {

    ProjectModel pm = ProjectModel(
      id: jsonData['id'],
      title: jsonData['title'],
    );

    if(jsonData['shoot_request_footage_categories'] != null){
      jsonData['shoot_request_footage_categories'].forEach((shoot_request) {
        pm.addChild(ProjectModel(id: shoot_request['id'],title: shoot_request['title'],icon:Icons.video_collection_rounded ));
      });
    }

    if(jsonData['video_request_draft_categories'] != null){
      jsonData['video_request_draft_categories'].forEach((video_request) {

        ProjectModel sub_pm = ProjectModel(id: video_request['id'],
            title: video_request['title'],
            icon:Icons.video_collection_rounded );

        sub_pm.mediaFiles =  video_request['drafts'].map<MediaFileModel>((data) => MediaFileModel.fromJson(data)).toList();

        pm.addChild(sub_pm);



      });
    }


    return pm;

  }

}

class MediaFileModel {
  final int? status;  // 200 - 204 - 400 - 404
  final int? id;
  final String? title;
  final String? url;
  final String? thumb_url;
  final int? file_size;
  final DateTime? created_at;
  final DateTime? updated_at;
  bool isSelected = false;

  MediaFileModel({this.status,
    this.id,
    this.title,
    this.url,
    this.thumb_url,
    this.file_size,
    this.created_at,
    this.updated_at,
  });

  factory MediaFileModel.fromJson(Map<String, dynamic> jsonData) {
    print(jsonData['title'].length);
    return MediaFileModel(
        status: 200,
        id:jsonData['id'],
        title:jsonData['title'],
        url:jsonData['media']['url'],
        thumb_url: jsonData['media']['thumb_url'] == null ? 'https://dashboard.videotechsolutions.co/storage/user/avatar/165998607062f1609696622.png' : jsonData['media']['thumb_url'],
        file_size:  jsonData['original_media']['file_size'],
        created_at:  DateTime.parse(jsonData['original_media']['created_at'].toString()),
      updated_at:  DateTime.parse(jsonData['original_media']['updated_at'].toString()),

    );
  }

}

class ProjectListModel {
  final int? status;  // 200 - 204 - 400 - 404
  final List<ProjectModel>? items;

  ProjectListModel({this.status,this.items});

  factory ProjectListModel.fromJson(Map<String, dynamic> jsonData) {
   // print(jsonData['items']);
    return ProjectListModel(
        status: 200,
        items:
            jsonData['items']
              .map<ProjectModel>((data) => ProjectModel.fromJson(data))
              .toList()
        );
  }
}

class ShootsAndEditsListModel {
  final int? status;  // 200 - 204 - 400 - 404
  final List<ProjectModel>? shoots;
  final List<ProjectModel>? edits;

  ShootsAndEditsListModel({this.status,this.shoots, this.edits});

  factory ShootsAndEditsListModel.fromJson(Map<String, dynamic> jsonData) {
    // print(jsonData['items']);
    return ShootsAndEditsListModel(
        status: 200,
        shoots:
        jsonData['items']['shoots']
            .map<ProjectModel>((data) => ProjectModel.fromJson(data))
            .toList(),
        edits: jsonData['items']['edits']
            .map<ProjectModel>((data) => ProjectModel.fromJson(data))
            .toList()
    );
  }
}
