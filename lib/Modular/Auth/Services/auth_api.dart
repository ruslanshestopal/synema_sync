import 'dart:convert';
import 'package:synema_sync/Modular/Auth/Models/user.dart';
import 'package:synema_sync/Utils/api.dart';
import 'package:synema_sync/View/Widgets/loading/loading.dart';
import 'package:synema_sync/View/Widgets/message/errorMessage.dart';
import 'package:synema_sync/View/Widgets/message/internetMessage.dart';
import 'package:synema_sync/View/Widgets/message/successMessage.dart';
import 'package:http/http.dart' as http;

class AuthApi extends SharedApi {
  // Login API
  Future<UserModel?> loginAPI(String mail, String password) async {
    print('AuthApi $mail $password');
    try {
      var jsonData;
      showLoading();
     Map<String, dynamic> body = {'username': mail, 'password': password};
      //AuthApi yis@videotechsolutions.co Synemair2022!
      var data = await http.post(
        Uri.parse( baseUrl + 'login'),

          headers: {
            "Accept": "application/json",
            "Content-Type": "application/x-www-form-urlencoded"
          },
          body: body

      );
      stopLoading();

      jsonData = json.decode(data.body);
      print(baseUrl);
      print(data.statusCode);
      print ("JSON >>>>"+json.encode(jsonData));



      if (data.statusCode == 200) {
        jsonData['status'] = 200;
        return UserModel.fromJson(jsonData);
      } else {
        showErrorMessage(jsonData['error'][0]);
        return UserModel.fromJson({"status": data.statusCode});
      }


    } on Exception catch (_) {
      print('Exception');
      stopLoading();
      showInternetMessage("Exception");
      return UserModel.fromJson({"status": 404});
    }
  }
    // Sign Up API
  Future<UserModel?> signupAPI(String phone,String firstName,String lastName, String password,String gender) async {
    try {
      var jsonData;
      showLoading();
      var data = await http.post(
        Uri.parse(baseUrl + 'user/create'),
        body: {'phone': phone,'firstname':firstName,'lastname':lastName, 'password': password,'gender':gender},
      );
      stopLoading();
      print(data.statusCode);
      jsonData = json.decode(data.body);
      if (data.statusCode == 200) {
        jsonData['user']['phone'] = phone;
        jsonData['user']['status'] = 200;
        return UserModel.fromJson(jsonData['user']);
      } else {
        showErrorMessage(jsonData['message']);
        return UserModel.fromJson({"status": data.statusCode});
      }
    } on Exception catch (_) {
      stopLoading();
      showInternetMessage("Exception");
      return UserModel.fromJson({"status": 404});
    }
  }

  // Check Token API
  Future<UserModel?> checkTokenApi(String token) async {
    print('checkTokenApi $token');
    try {
      var headers = {
        "Auth-token": token,
      };
      var jsonData;
      showLoading();
      var data = await http.post(Uri.parse(baseUrl + 'login'), headers: headers);
      stopLoading();
      jsonData = json.decode(data.body);
      print(jsonData);
      if (data.statusCode == 200) {
        print('checkTokenApi: 200');
        jsonData['user']['status'] = 200;
        jsonData['user']['token'] = token;
        return UserModel.fromJson(jsonData['user']);
      } else if (data.statusCode == 401) {
        print('checkTokenApi: 401');
        showErrorMessage(jsonData['error'][0]);
        return UserModel.fromJson({"status": data.statusCode});
      } else {
        print('checkTokenApi:!!!');
        showErrorMessage("Something wrong here");
        return UserModel.fromJson({"status": data.statusCode});
      }
    } on Exception catch (_) {
      print('checkTokenApi: Exception');
      stopLoading();
      showInternetMessage("404");
      return UserModel.fromJson({"status": 404});
    }
  }

// Change Password API
  Future<int> chagnePasswordAPI(String oldPassword, String newPassword) async {
    try {
      showLoading();
      var data = await http.put(Uri.parse(baseUrl + 'user'),
          body: {'oldPassword': oldPassword, 'newPassword': newPassword},
          headers: getToken());
      stopLoading();
      var jsonData = json.decode(data.body);

      if (data.statusCode == 200) {
        showSuccessMessage(jsonData['message']);
      } else {
        showErrorMessage(jsonData['message']);
      }
      return data.statusCode;
    } on Exception catch (_) {
      stopLoading();
      showInternetMessage("404");
      return 404;
    }
  }

  // Change User Photo API
  Future<UserModel> changePhotoAPI(image) async {
    try {
      showLoading();
      var request =
          http.MultipartRequest('POST', Uri.parse(baseUrl + 'user/photo'));
      request.headers.addAll(getToken());
      request.files.add(await http.MultipartFile.fromPath('file', image.path));
      var response = await request.send();
      var data = await http.Response.fromStream(response);
      stopLoading();
      var jsonData = json.decode(data.body);

      if (data.statusCode == 200) {
        showSuccessMessage(jsonData['message']);
        jsonData['status'] = data.statusCode;
        return UserModel.fromJson(jsonData);
      } else {
        showErrorMessage(jsonData['message']);
        jsonData['status'] = data.statusCode;
        return UserModel.fromJson(jsonData);
      }
    } on Exception catch (_) {
      stopLoading();
      showInternetMessage("404");
      return UserModel.fromJson({"status": 404});
    }
  }
  // Change Password API
  Future<int> chagneNameAPI(String firstName, String lastName) async {
    try {
      showLoading();
      var data = await http.put(Uri.parse(baseUrl + 'user'),
          body: {'firstname': firstName, 'lastname': lastName},
          headers: getToken());
      stopLoading();
      var jsonData = json.decode(data.body);

      if (data.statusCode == 200) {
        showSuccessMessage(jsonData['message']);
      } else {
        showErrorMessage(jsonData['message']);
      }
      return data.statusCode;
    } on Exception catch (_) {
      stopLoading();
      showInternetMessage("404");
      return 404;
    }
  }


}
