import 'dart:async';

import 'package:final_project/utils/colors.dart';
import 'package:final_project/widgets/progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:provider/provider.dart';
import 'on_boarding.dart';
// import 'package:flutter_rounded_progress_bar/flutter_rounded_progress_bar.dart';
// import 'package:flutter_rounded_progress_bar/rounded_progress_bar_style.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({ Key? key }) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState(){
    super.initState();
    splashScreenStart();
  }

  splashScreenStart() async{
    var duration = const Duration(seconds: 3);
    return Timer(duration, (){
      Get.to(OnBoarding());
    }); 
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 200,
          height: 200,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[ 
              Text(
                'JustWatch.',
                style: TextStyle(
                  fontFamily: "Playfair-Display",
                  fontSize: 36,
                  fontWeight: FontWeight.w700,
                  color: mainTextColor,
                ),
              ),
              Padding(padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Divider(thickness: 2, color: Colors.white,)
              ),
              // Container(
              //   margin: const EdgeInsets.only(top: 20),
              //   child: RoundedProgressBar(
              //     milliseconds: 5000,
              //     height: 10,
              //     style: RoundedProgressBarStyle(
              //       widthShadow: 0,colorBorder: Colors.white,
              //       borderWidth: 1,
              //       colorProgress: Colors.white,
              //       backgroundProgress: mainTheme,
              //     ),
              //     borderRadius: BorderRadius.circular(16),
              //   ),
              // )
              // Consumer<TimeState>(builder: (context, timeState, _) => CostumProgressBar(
              //   width: 200,
              //   value: timeState.time,
              //   totalValue: 15,
              //   ),
              // ),
              // Consumer<TimeState>(
              //   builder: (context, timeState, _) => ElevatedButton(
                  
              //     onPressed:() {
              //       Timer.periodic(Duration(seconds: 1),(timer){
              //       if(timeState.time == 15) timer.cancel();
              //       else timeState.time+= 1;
              //       });
              //     }, 
              //     child: Text(""),
                  
              //   )
              // )
            ],
          ),
        ),
      )
    );
  }
}