import 'package:flutter/material.dart';
import 'package:synema_sync/Modular/Auth/Controllers/auth_controller.dart';
import 'package:synema_sync/Modular/Projects/Controller/project_controller.dart';
import 'package:synema_sync/Modular/Projects/Controller/mediagrid_controller.dart';
import 'package:synema_sync/Modular/Projects/Models/project_list.dart';
import 'package:synema_sync/View/Widgets/AutoLoad/auto_load.dart';
import 'package:synema_sync/View/Widgets/NoNetwork/no_network.dart';
import 'package:get/get.dart';
import 'package:synema_sync/list_treeview/list_treeview.dart';
import 'package:reorderable_grid_view/reorderable_grid_view.dart';
import 'package:auto_size_text/auto_size_text.dart';

class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    print("HomeScreen");
    //TreeViewController treeController = Get.find();
    return GetBuilder<ProjectController>(
      builder: (controller) => AutoLoad(
        onInit: controller.loadProjests,
        child: Scaffold(
            backgroundColor: Colors.black,
            appBar: AppBar(
            toolbarHeight: 40,
            backgroundColor: Color(0xFF494949),
            iconTheme: const IconThemeData(
              size: 27,
              color: Colors.white,
            ),
            title:Text(''),
            centerTitle: true,

            actions: [
              GetBuilder<AuthController>(
                builder: (controller) => IconButton(
                  color: Colors.white,
                  onPressed: () async {
                    await controller.logout();
                  },
                  icon: Icon(Icons.logout),
                ),
              ),
              GetBuilder<AuthController>(
                builder: (controller) =>  InkWell(
                  onTap: ()  {
                    print(controller.user?.photo);
                    Get.toNamed("/profile");
                  },
                  child:Container(
                    width: 25,
                    height: 25,
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: Image.network(
                      controller.user!.photo!,
                    ),
                  ),
                ),
              ),

            ],
          ),
          body:  Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 3,
                    child:Container(
                      width: MediaQuery.of(context).size.width,
                      height: 100,
                      margin: const EdgeInsets.all(0.0),
                      padding: const EdgeInsets.all(0.0),
                      decoration: BoxDecoration(
                          border: Border.all(color: Color(0xFF3D3D3F))
                      ),
                      child:  Padding(
                        padding: const EdgeInsets.fromLTRB(30, 25, 20, 40),
                        child:  Image.asset(
                          'assets/img/logo.png',
                          width: 100,
                          height: 25,
                          fit: BoxFit.scaleDown,
                        ),

                      ),
                    ),
                  ),
                  Expanded(
                      flex: 5,
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 100,
                        margin: const EdgeInsets.all(0.0),
                        padding: const EdgeInsets.all(0.0),
                        decoration: BoxDecoration(
                            border: Border.all(color: Color(0xFF3D3D3F))
                        ),
                        child:  Padding(
                          padding: const EdgeInsets.fromLTRB(15, 40, 15, 5),
                          child:  TextFormField(

                            decoration: InputDecoration(
                              hintText: 'Search...',

                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.white12,
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.white12,
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              filled: true,
                              fillColor: Colors.white12,
                              contentPadding: EdgeInsetsDirectional.fromSTEB(16, 4, 0, 24),
                              suffixIcon: InkWell(
                                onTap: () {
                                },
                                focusNode: FocusNode(skipTraversal: true),
                                child: Icon(
                                  Icons.search,
                                  color: Colors.white,
                                  size: 22,
                                ),
                              ),
                            ),

                          ),
                        ),
                        ),


                  ),
                  Expanded(
                    flex: 2, // 20%
                    child: Container(color: Colors.brown),
                  )
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height-140.0 ,
                      child:
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[

                              Expanded(
                                flex: 3,
                                child:SingleChildScrollView(
                                  child:
                                  Column(

                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 7),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                                              child: ElevatedButton(
                                                onPressed: () async {

                                                },
                                                child: Text('Add new'),

                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      getBody(),

                                    ],
                                  ),
                                ),
                              ),
                              Expanded(
                                  flex: 5,
                                  child: Container(
                                    width: MediaQuery.of(context).size.width,
                                    height: MediaQuery.of(context).size.height-100,
                                    margin: const EdgeInsets.all(0.0),
                                    padding: const EdgeInsets.all(0.0),
                                    decoration: BoxDecoration(
                                        border: Border.all(color: Color(0xFF3D3D3F))
                                    ),
                                    child:  Padding(
                                      padding: const EdgeInsets.fromLTRB(10, 15, 20, 10),
                                      child: TheGridView(),

                                    ),
                                  ),
                              ),
                              Expanded(
                                flex: 2, // 20%
                                child:   getMetaDataBody(),
                                                           ),
                            ],
                          ),
                    ),
                  ),
                ],
              ),
            ],
          )

        ),
      ),
    );
  }
}

Widget getLayout(){
return Text('sss');
}
class TheGridView extends StatelessWidget {
  TheGridView({Key? key}) : super(key: key);

  MediaGridController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MediaGridController>(builder: (controller) {
      var size = MediaQuery.of(context).size;

      print(size);
      final double itemHeight = 102+(size.height) / 3;
      final double itemWidth = size.width / 3;

      if(controller.mediaFiles.length == 0){
        return Padding(
          padding: EdgeInsetsDirectional.fromSTEB(18, 18, 0, 0),
          child:             Text(
            'Destenation ’${controller.selectedItem?.title}‘ is empty',
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            softWrap: false,
            style: TextStyle(
              fontFamily: 'Outfit',
              color: Color(0xFFFFFFFF),
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          )


        );


      }
      return ReorderableWrapperWidget(
        child: GridView.builder(
            controller: ScrollController(),

            gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: (itemWidth / itemHeight),
                mainAxisSpacing: 5.0,
                crossAxisSpacing: 5.0, //
                crossAxisCount: 3),
            itemCount: controller.mediaFiles.length,
            itemBuilder: (context, index) {

              MediaFileModel itemData = controller.mediaFiles[index];

              return ReorderableItemView(
                  child: Container(
                      decoration: itemData.isSelected ? BoxDecoration(
                          color: Color(0xFFF15B6D),
                          borderRadius: BorderRadius.circular(8))
                          : BoxDecoration(
                          color: Colors.white12,
                  borderRadius: BorderRadius.all( Radius.circular(8),
                  )) ,
                    child: // Generated code for this Column Widget...
                    Column(
                      children: [

                        ClipRRect(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(0),
                            bottomRight: Radius.circular(0),
                            topLeft: Radius.circular(8),
                            topRight: Radius.circular(8),
                          ),
                          child: Image.network(
                            '${itemData.thumb_url}',
                            width: double.infinity,

                            fit: BoxFit.cover,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),

                          child:
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,

                                children: [
                                  InkWell(
                                    onTap: (){
                                      print('onTap ${itemData.title}');
                                      controller.selectMedia(itemData);
                                    },
                                    child:  Text(
                                      '${itemData.title}',
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 2,
                                      softWrap: false,
                                      style: TextStyle(
                                        fontFamily: 'Outfit',
                                        color: Color(0xFFFFFFFF),
                                        fontSize: 12,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                  ),

                                ],
                              ),

                        ),
                      ],
                    ),


                  ),
                  key: ValueKey(index),
                  index: index);

            }),
        // the drag and drop index is from (index passed to ReorderableItemView)
        onReorder: (dragIndex, dropIndex) {

          MediaFileModel item = controller.mediaFiles.removeAt(dragIndex);
          controller.mediaFiles.insert(dropIndex, item);
          print("dragIndex $dragIndex dropIndex $dropIndex");
          controller.update();

        },

      );


    }
    );
  }

}

Widget getMetaDataBody(){

  print("getMediafilesBody");
  //MediaGridController controller = Get.find();

  return GetBuilder<MediaGridController>(builder: (controller) {
    if(controller.selectedMedia == null){
      return Text('');
    }
    return Column(
        children: [
        Padding(
        padding: EdgeInsets.all(10),
          child:
          Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Text(
              'File name:',
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              softWrap: false,
              style: TextStyle(
                fontFamily: 'Outfit',
                color: Color(0xFFFFFFFF),
                fontSize: 22,
                fontWeight: FontWeight.normal,
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 25),
              child: Text(
                '${controller.selectedMedia?.title}',
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                softWrap: false,
                style: TextStyle(
                  fontFamily: 'Outfit',
                  color: Color(0xFFFFFFFF),
                  fontSize: 12,
                  fontWeight: FontWeight.normal,
                ),
              ),

            ),

            Text(
              'File size (Bytes):',
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              softWrap: false,
              style: TextStyle(
                fontFamily: 'Outfit',
                color: Color(0xFFFFFFFF),
                fontSize: 22,
                fontWeight: FontWeight.normal,
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 25),
              child: Text(
                '${controller.selectedMedia?.file_size}',
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                softWrap: false,
                style: TextStyle(
                  fontFamily: 'Outfit',
                  color: Color(0xFFFFFFFF),
                  fontSize: 12,
                  fontWeight: FontWeight.normal,
                ),
              ),

            ),
            Text(
              'Created on:',
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              softWrap: false,
              style: TextStyle(
                fontFamily: 'Outfit',
                color: Color(0xFFFFFFFF),
                fontSize: 22,
                fontWeight: FontWeight.normal,
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 25),
              child: Text(
                '${controller.selectedMedia?.created_at}',
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                softWrap: false,
                style: TextStyle(
                  fontFamily: 'Outfit',
                  color: Color(0xFFFFFFFF),
                  fontSize: 12,
                  fontWeight: FontWeight.normal,
                ),
              ),

            ),
            Text(
              'Last updated on:',
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              softWrap: false,
              style: TextStyle(
                fontFamily: 'Outfit',
                color: Color(0xFFFFFFFF),
                fontSize: 22,
                fontWeight: FontWeight.normal,
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 25),
              child: Text(
                '${controller.selectedMedia?.updated_at}',
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                softWrap: false,
                style: TextStyle(
                  fontFamily: 'Outfit',
                  color: Color(0xFFFFFFFF),
                  fontSize: 12,
                  fontWeight: FontWeight.normal,
                ),
              ),

            ),
          ],
         ),

          ),
    ] );


  }
  );

}

Widget getBody() {
  ProjectController _controller = Get.find();
  return ListTreeView(
    shrinkWrap: true,
    padding: EdgeInsets.all(10),

    itemBuilder: (BuildContext context, NodeData data) {
     // print(data);
      ProjectModel item = data as ProjectModel;
      double width = MediaQuery.of(context).size.width;
      double offsetX = item.level * 16.0;
      return Container(
        height: 35,
        width:  360,
        padding: EdgeInsets.symmetric(horizontal: 16),
        decoration: item.isExpand && item.level == 0 ? BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            stops: [
              0.0,
              0.9877,
            ],
            colors: [
              Color(0xFFF15B6D),
              Color(0xFF8A69E5),
            ],
          ),
          border: Border.all(
            color: Colors.black,
            width: 2.0,
          ),
          borderRadius: BorderRadius.all( Radius.circular(8)),
        ) : BoxDecoration(
             borderRadius: BorderRadius.all( Radius.circular(8)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(left: offsetX),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Visibility(
                      visible: item.isExpand && item.level<3,
                        child: Icon(
                          Icons.expand_more,
                          size: 15,
                        ),
                    ),
                    Visibility(
                      visible: !item.isExpand && item.level<3,
                      child: Icon(
                        Icons.arrow_forward_ios_outlined,
                        size: 10,
                      ),
                    ),

                    Padding(
                      padding: EdgeInsets.fromLTRB(5,0,5,0),
                      child: InkWell(
                        splashColor: Colors.amberAccent.withOpacity(1),
                        highlightColor: Colors.red,
                        onTap: () {
                          print("selectAllChild");
                          //_controller.treeController.selectAllChild(item);
                          //selectAllChild(item);
                        },
                        child: data.isSelected
                            ? Icon(
                          Icons.folder,
                          size: 20,
                          color: Color(0xFFFFFFFF),
                        )
                            : Icon(
                          item.icon,
                          size: 20,
                          color: Color(0xFFFFFFFF),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Expanded(
                      child: Text(
                        '${item.title}',
                        style: TextStyle(color: Color(0xFFFFFFFF)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            /*
            Visibility(
              visible: item.isExpand,
              child: InkWell(
                onTap: () {
                  print("ID: ${item.children.length}");

                  //add(item);
                },
                child: Icon(
                  Icons.videocam_rounded,
                  size: 20,
                ),
              ),
            )
            */

          ],
        ),
      );

    },
    onTap: (NodeData data) {
     // print('index = ${data.index} expanded ${data.isExpand} selected ${data.isSelected}');

      _controller.loadProjestWithID(data as ProjectModel);
    },
    onLongPress: (data) {
      //delete(data);
    },
    controller: _controller.treeController,
  );

}
class ProjectsListTile extends StatelessWidget {

  ProjectsListTile({super.key});



  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProjectController>(builder: (controller) {
      if(controller.homeScreen == false){
        return Text("There are projects to show: ${controller.projects?.items?.length}");
      }else{
        return NoNetwork(
          onInit: controller.loadProjests,
        );
      }

    }
    );

    }
}