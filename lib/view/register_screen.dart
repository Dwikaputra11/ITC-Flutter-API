import 'package:final_project/configs/config.dart';
import 'package:final_project/controller/auth_controller.dart';
import 'package:final_project/view/login_screeen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../utils/colors.dart';
import '../utils/font_style.dart';
import 'home_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool? _passwordVisible;
  bool? _confirmPasswordVisible;
  final _emailController = TextEditingController();
  final _fullNameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  // void saveLocal(String fullName) async{
  //   final spf =await SharedPreferences.getInstance();
  //   spf.setString('fullName', fullName);
  // }
  @override
  void initState() {
    super.initState();
    _passwordVisible = true;
    _confirmPasswordVisible = true;
  }

  bool isValid() {
    if (_passwordController.text.length > 7) {
      if (_passwordController.text
              .trim()
              .compareTo(_confirmPasswordController.text.trim()) ==
          0) {
        return true;
      }
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [gradientColor1, gradientColor2, gradientColor1])),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Center(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    const Text(
                      "Register",
                      style: loginRegisterTitle,
                    ),
                    SizedBox(
                      height: size.height * 0.05,
                    ),
                    Container(
                        width: size.width * 0.8,
                        height: size.height * 0.55,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            SizedBox(
                              height: size.height * 0.05,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 20.0, right: 30),
                              child: TextField(
                                // focusNode: emailInput,
                                controller: _emailController,
                                style: const TextStyle(color: Colors.white),
                                decoration: InputDecoration(
                                  enabledBorder: const UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0xFFE5E5E5),
                                    ),
                                  ),
                                  focusedBorder: const UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0xFFE5E5E5),
                                    ),
                                  ),
                                  labelText: 'Email ID',
                                  labelStyle: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w400),
                                  icon: SvgPicture.asset(
                                      'lib/utils/img/email.svg',
                                      color: Colors.white),
                                  // prefixIcon: SvgPicture.asset('assets/img/tugas12/email.svg'),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: size.height * 0.03,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 20.0, right: 30),
                              child: TextField(
                                // focusNode: emailInput,
                                controller: _fullNameController,
                                style: const TextStyle(color: Colors.white),
                                decoration: const InputDecoration(
                                    enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0xFFE5E5E5),
                                    ),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0xFFE5E5E5),
                                    ),
                                  ),
                                  labelText: 'Full Name',
                                  labelStyle: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w400),
                                    icon: Icon(
                                      Icons.person_outline,
                                      color: Colors.white,
                                    )
                                    // icon: SvgPicture.asset('lib/utils/img/email.svg', color: Colors.white),
                                    // prefixIcon: SvgPicture.asset('assets/img/tugas12/email.svg'),
                                    ),
                              ),
                            ),
                            SizedBox(
                              height: size.height * 0.03,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 20.0, right: 30),
                              child: TextField(
                                // focusNode: emailInput,
                                controller: _passwordController,
                                obscureText: _passwordVisible!,
                                style: const TextStyle(color: Colors.white),
                                decoration: InputDecoration(
                                  enabledBorder: const UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0xFFE5E5E5),
                                    ),
                                  ),
                                  focusedBorder: const UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0xFFE5E5E5),
                                    ),
                                  ),
                                  labelText: 'Password',
                                  labelStyle: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w400),
                                  icon: SvgPicture.asset(
                                    'lib/utils/img/password.svg',
                                    color: Colors.white,
                                  ),
                                  suffixIcon: IconButton(
                                    icon: Icon(
                                        _passwordVisible!
                                            ? Icons.visibility_off_outlined
                                            : Icons.visibility_outlined,
                                        color: Colors.white),
                                    onPressed: () {
                                      setState(() {
                                        _passwordVisible = !_passwordVisible!;
                                      });
                                    },
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: size.height * 0.03,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 20.0, right: 30),
                              child: TextField(
                                // focusNode: emailInput,
                                controller: _confirmPasswordController,
                                obscureText: _confirmPasswordVisible!,
                                style: const TextStyle(color: Colors.white),
                                decoration: InputDecoration(
                                  enabledBorder: const UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0xFFE5E5E5),
                                    ),
                                  ),
                                  focusedBorder: const UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0xFFE5E5E5),
                                    ),
                                  ),
                                  labelText: 'Confirm Password',
                                  labelStyle: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w400),
                                  icon: SvgPicture.asset(
                                    'lib/utils/img/password.svg',
                                    color: Colors.white,
                                  ),
                                  suffixIcon: IconButton(
                                    icon: Icon(
                                        _confirmPasswordVisible!
                                            ? Icons.visibility_off_outlined
                                            : Icons.visibility_outlined,
                                        color: Colors.white),
                                    onPressed: () {
                                      setState(() {
                                        _confirmPasswordVisible =
                                            !_confirmPasswordVisible!;
                                      });
                                    },
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: size.height * 0.01,
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: size.width * 0.25),
                              child: Row(
                                children: [
                                  const Text(
                                    'Already have account?',
                                    style: mainTextStyle_14,
                                  ),
                                  TextButton(
                                    child: const Text('Login',
                                        style: mainTextStyleBold_14),
                                    onPressed: () {
                                      Get.to(() => const LoginScreen());
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ],
                        )),
                    Container(
                      margin: EdgeInsets.only(top: size.height * 0.06),
                      width: size.width * 0.5,
                      height: size.height * 0.05,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          foregroundColor:
                              MaterialStateProperty.all<Color>(Colors.white),
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Colors.white.withOpacity(0.3)),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                          )),
                        ),
                        onPressed: () async {
                          if (isValid()) {
                            AuthController.instance.register(
                                _emailController.text.trim(),
                                _passwordController.text);
                            // Get.to(() => const HomeScreen();
                          }
                        },
                        child: const Text(
                          'Register',
                          style: mainTextStyle_14,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
