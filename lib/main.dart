import 'package:final_project/configs/config.dart';
import 'package:final_project/controller/auth_controller.dart';
import 'package:final_project/utils/colors.dart';
import 'package:final_project/view/home_screen.dart';
import 'package:final_project/view/on_boarding.dart';
import 'package:final_project/view/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


import 'view/login_screeen.dart';
import 'view/on_boarding.dart';
import 'view/register_screen.dart';

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // await firebaseInitialization.then((value){
  //   Get.put(AuthController());
  // });
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Playfair-Display',
        textTheme: Theme.of(context).textTheme.apply(displayColor: mainTextColor),
        scaffoldBackgroundColor: mainTheme,
        // primarySwatch: Colors.blue,
      ),
      home: HomeScreen(email: 'Dwika'),
    );
  }
}