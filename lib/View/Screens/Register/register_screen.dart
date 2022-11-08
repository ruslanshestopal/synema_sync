import 'package:flutter/material.dart';
import 'package:synema_sync/Modular/Auth/Controllers/auth_controller.dart';
import 'package:get/get.dart';

class RegisterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final phoneIn = TextEditingController();
    final firstNameIn = TextEditingController();
    final lastNameIn = TextEditingController();
    final passwordIn = TextEditingController();
    final genderdIn = TextEditingController();
    phoneIn.text = "+380661111999";
    passwordIn.text = "123456";
    firstNameIn.text = "Ruslan";
    lastNameIn.text = "Shestopal";
    genderdIn.text = "1";
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60,
        iconTheme: const IconThemeData(
          size: 27,
          color: Colors.white, //change color on your need
        ),
        title:Image.asset('assets/img/logo.png',  fit: BoxFit.scaleDown,  height: 45,),
        centerTitle: true,
      ),
      body: Container(
        margin: EdgeInsets.all(20),
        alignment: Alignment.center,
        child: GetBuilder<AuthController>(
          builder: (controller) => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Phone"),
              TextField(
                controller: phoneIn,
              ),
              Text("First Name"),
              TextField(
                controller: firstNameIn,
              ),
              Text("Last Name"),
              TextField(
                controller: lastNameIn,
              ),
              Text("Password"),
              TextField(
                controller: passwordIn,
              ),
              Text("Gender"),
              TextField(
                controller: genderdIn,
              ),
              GetBuilder<AuthController>(
                  builder: (controller) => ElevatedButton(
                      onPressed: () async {
                        await controller.signup(phoneIn.text, firstNameIn.text,
                            lastNameIn.text, passwordIn.text, genderdIn.text);
                      },
                      child: Text("Sign Up"))),
              OutlinedButton(
                onPressed: () {
                  Get.offAndToNamed("/login");
                },
                child: Text("Login"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
