import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:synema_sync/View/Screens/ChangePassword/change_password.dart';
import 'package:synema_sync/View/Screens/Home/home_screen.dart';
import 'package:synema_sync/View/Screens/Login/login_screen.dart';
import 'package:synema_sync/View/Screens/Start/start_screen.dart';
import 'package:synema_sync/utils/app_binding.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'View/Screens/Profile/profile_screen.dart';
import 'View/Screens/Register/register_screen.dart';
import 'package:bitsdojo_window/bitsdojo_window.dart';

void main() async {
  print("Main");
  await GetStorage.init();
  runApp(MyApp());


  doWhenWindowReady(() {
    final initialSize = Size(1200, 680);
    final minSize = Size(1000, 680);
    final maxSize = Size(1200, 850);
    appWindow.maxSize = maxSize;
    appWindow.minSize = minSize;
    appWindow.size = initialSize; //default size
    appWindow.show();
  });

}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("App build");
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme(
          brightness: Brightness.dark,
          surface: Colors.black,
          onSurface: Colors.black,
          // Colors that are not relevant to AppBar in DARK mode:
          primary: Colors.white,
          onPrimary: Colors.grey,
          secondary: Colors.grey,
          onSecondary: Colors.grey,
          background: Colors.grey,
          onBackground: Colors.grey,
          error: Colors.grey,
          onError: Colors.grey,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
                padding:
                const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                primary: Color(0xFFF15B6D) , // background color
                textStyle: const TextStyle(
                  inherit: false,
                    color:  Color(0xFFFFFFFF),
                    fontSize: 14,
                    fontStyle: FontStyle.normal,


                )
            )
        ),
      ),

      title: 'SynemaSync',
      builder: BotToastInit(),
      navigatorObservers: [BotToastNavigatorObserver()],
      initialRoute: '/',
      initialBinding: AppBinding(),
      getPages: [
        GetPage(name: '/', page: () => StartScreen()),
        GetPage(name: '/login', page: () => LoginScreen()),
        GetPage(name: '/register', page: () => RegisterScreen()),
        GetPage(name: '/home', page: () => HomeScreen()),
        GetPage(name: '/profile', page: () => ProfileScreen()),
        GetPage(name: '/changePassword', page: () => ChangePasswordScreen()),
      ],
    );
  }
}
