
class UserModel {
  final int? status;  // 200 - 204 - 400 - 404
  final String? mail;
  String? firstname;
  String? lastname;
  String? photo;
  final String? token;


  UserModel({this.status,this.mail, this.firstname, this.lastname,  this.photo, this.token});

  factory UserModel.fromJson(Map<String, dynamic> jsonData) {



    return UserModel(
        status: jsonData['status'],
        mail: jsonData['data'] == null ? null : jsonData['data']['email'],
        firstname: jsonData['data'] == null ? null : jsonData['data']['firstname'],
        lastname: jsonData['data'] == null ? null : jsonData['data']['lastname'],
        photo: jsonData['data'] == null ? null :jsonData['data']['avatar'],
        token: jsonData['data'] == null ? null : jsonData['Auth-token']
        );

    /*
    return UserModel(
        status: 200,
        mail: 'yis@videotechsolutions.co',
        firstname: 'yis@videotechsolutions.co',
        lastname: jsonData['lastname'],
        photo: 'no fphoto',
        token: '6f7b785111901afd84a7ea9f4aebc60f84ecd9ce'
    );

     */
  }
}

