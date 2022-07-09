import 'package:final_project/controller/auth_controller.dart';
import 'package:final_project/utils/colors.dart';
import 'package:final_project/utils/font_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import 'register_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({ Key? key }) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool? _passwordVisible;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  void initState() {
    super.initState();
    _passwordVisible = false;
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [gradientColor1, gradientColor2, gradientColor1]
        )
      ),
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
                    "Login",
                    style: loginRegisterTitle,),
                  SizedBox(height: size.height*0.05,),
                  Container(
                    width: size.width*0.8,
                    height: size.height*0.4,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(height: size.height*0.08,),
                        Padding(
                          padding: const EdgeInsets.only(left: 20.0, right: 30),
                          child: TextField(
                            controller: _emailController,
                            style: const TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                              enabledBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(color: Color(0xFFE5E5E5)),
                              ),
                              focusedBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(color: Color(0xFFE5E5E5)),
                              ),
                              labelText: 'Email ID',
                              labelStyle: const TextStyle(color: Colors.white),
                              icon: SvgPicture.asset('lib/utils/img/email.svg', color: Colors.white),
                            ),
                          ),
                        ),
                        SizedBox(height: size.height*0.05,),
                        Padding(
                          padding: const EdgeInsets.only(left: 20.0, right: 30),
                          child: TextField(
                            controller: _passwordController,
                            obscureText: !_passwordVisible!,
                            style: const TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                              enabledBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(color: Color(0xFFE5E5E5)),
                              ),
                              focusedBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(color: Color(0xFFE5E5E5)),
                              ),
                              labelText: 'Password',
                              labelStyle: const TextStyle(color: Colors.white),
                              icon: SvgPicture.asset('lib/utils/img/password.svg', color: Colors.white,),
                              suffixIcon: IconButton(
                                icon: Icon(
                                  !_passwordVisible!
                                  ? Icons.visibility_off_outlined
                                  : Icons.visibility_outlined, 
                                  color: Colors.white
                                ),
                                onPressed: (){
                                  setState(() {
                                    _passwordVisible = !_passwordVisible!;
                                  });
                                }
                              ), 
                            ),
                          ),
                        ),
                        SizedBox(height: size.height*0.01,),
                        Padding(
                          padding: EdgeInsets.only(left: size.width*0.4),
                          child: Row(
                            children: [
                              const Text(
                                'New Here?',
                                style: mainTextStyle_14,
                              ),
                              TextButton(
                                child: const Text(
                                  ' Register',
                                  style: mainTextStyleBold_14
                                ),
                                onPressed: (){
                                  Get.to(() => const RegisterScreen());
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    )
                  ),
                  Container(
                    margin: EdgeInsets.only(top: size.height*0.06),
                    width: size.width*0.5,
                    height: size.height*0.05,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                        backgroundColor: MaterialStateProperty.all<Color>(Colors.white.withOpacity(0.3)),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                          )
                        ),
                      ),
                      onPressed: () async{
                        AuthController.instance.login(_emailController.text.trim(), 
                        _passwordController.text.trim(), context);
                        // Get.to(() => const HomeScreen());
                      }, 
                      child: const Text(
                        'Login',
                        style: mainTextStyle_14,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
      ),
    );
  }
}