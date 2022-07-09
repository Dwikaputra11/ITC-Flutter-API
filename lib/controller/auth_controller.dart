import 'package:final_project/view/home_screen.dart';
import 'package:final_project/view/register_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../configs/config.dart';
import '../view/splash_screen.dart';

class AuthController extends GetxController {
  static AuthController instance = Get.find();
  // FirebaseAuth auth = FirebaseAuth.instance;
  late Rx<User?> firebaseUser;
  
  late Rx<GoogleSignInAccount?> googleSignInAccount;

  @override
  void onReady() {
    super.onReady();
    // auth is comning from the constants.dart file but it is basically FirebaseAuth.instance. 
    // Since we have to use that many times I just made a constant file and declared there
    
    firebaseUser = Rx<User?>(auth.currentUser);
    googleSignInAccount = Rx<GoogleSignInAccount?>(googleSign.currentUser);
      
      
    firebaseUser.bindStream(auth.userChanges());
    ever(firebaseUser, _setInitialScreen);

    
    googleSignInAccount.bindStream(googleSign.onCurrentUserChanged);
    ever(googleSignInAccount, _setInitialScreenGoogle);
  }

  _setInitialScreen(User? user) {
    if (user == null) {
        
      // if the user is not found then the user is navigated to the Register Screen
      Get.offAll(() => const SplashScreen());
        
    } else {
        
      // if the user exists and logged in the the user is navigated to the Home Screen
      Get.offAll(() => HomeScreen(email: user.email!,));
        
    }
  }

  _setInitialScreenGoogle(GoogleSignInAccount? googleSignInAccount) {
    if (kDebugMode) {
      print(googleSignInAccount);
    }
    if (googleSignInAccount == null) {
      // if the user is not found then the user is navigated to the Register Screen
      Get.offAll(() => const RegisterScreen());
    } else {
      // if the user exists and logged in the the user is navigated to the Home Screen
      Get.offAll(() => HomeScreen(email: googleSignInAccount.email.toString(),));
    }
  }

  void signInWithGoogle() async {
    try {
      GoogleSignInAccount? googleSignInAccount = await googleSign.signIn();

      if (googleSignInAccount != null) {
        GoogleSignInAuthentication googleSignInAuthentication =
            await googleSignInAccount.authentication;

        AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken,
        );

        await auth
            .signInWithCredential(credential)
            .catchError((onErr) => print(onErr));
      }
    } catch (e) {
      Get.snackbar(
        "Error",
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
      );
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }

  void register(String email, password) async {
    try {
      await auth.createUserWithEmailAndPassword(
          email: email, password: password);     
    } catch (firebaseAuthException) {
      rethrow;
    }
  }

  void login(String email, password, BuildContext context) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
    } catch (firebaseAuthException) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Enter your email and password')));
    }
  }

  void signOut() async {
    await auth.signOut();
  }
}