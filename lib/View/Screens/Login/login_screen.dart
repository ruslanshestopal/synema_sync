import 'package:flutter/material.dart';
import 'package:synema_sync/Modular/Auth/Controllers/auth_controller.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("LoginScreen");
    final phoneIn = TextEditingController();
    final passwordIn = TextEditingController();
    phoneIn.text = "yis@videotechsolutions.co";
    passwordIn.text = "Synemair2022!";
    return Scaffold(
      body: Container(
        margin: EdgeInsets.all(100),
        alignment: Alignment.center,
        child: GetBuilder<AuthController>(
          builder: (controller) => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 24),
                child: Image.asset(
                  'assets/img/logo.png',
                  width: 375,
                  height: 80,
                  fit: BoxFit.fitWidth,
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 24),
                child:   TextFormField(
                  controller: phoneIn,
                  autofocus: true,
                  textInputAction: TextInputAction.next,
                  decoration: const InputDecoration(
                    filled: true,
                    hintText: 'Email or username',
                  ),
                  onChanged: (value) {
                    print(value);
                  },
                  validator: (value) {

                  },
                ),
              ),

              TextFormField(
                controller: passwordIn,
                decoration: const InputDecoration(
                  filled: true,
                  labelText: 'Password',
                ),
                obscureText: true,
                onChanged: (value) {
                  print(value);
                },
              ),
              Align(
                alignment: AlignmentDirectional(1.0, 0),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 20),
                  child: InkWell(
                    onTap: () async {
                      Get.toNamed("/changePassword");
                    },
                    child: Text(
                        'Forgot password?',
                        style: TextStyle(
                            color: Color(0xFFF15B6D)
                        )
                    ),
                  ),
                ),
              ),
              GetBuilder<AuthController>(
                  builder: (controller) => ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size.fromHeight(50),
                      ),
                      onPressed: () async {
                        await controller.login(phoneIn.text, passwordIn.text);
                      },
                      child: Text("Login")
                  )
              ),

              // Generated code for this Row Widget...
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 10, 24, 12),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      'Don’t have an account? ',

                    ),
                    InkWell(
                      onTap: () async {
                       // Get.offAndToNamed("/register");
                        Get.toNamed("/register");
                      },
                      child: Text(
                          ' Sign up',
                          style: TextStyle(
                              color: Color(0xFFF15B6D)
                          )
                      ),
                    ),
                  ],
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}


