import 'package:final_project/utils/colors.dart';
import 'package:final_project/utils/font_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:introduction_screen/introduction_screen.dart';

import 'login_screeen.dart';

class OnBoarding extends StatelessWidget {
  OnBoarding({Key? key}) : super(key: key);

  final pageDecoration = PageDecoration(
    titleTextStyle: const PageDecoration().titleTextStyle.copyWith(
        color: mainTextColor, fontSize: 20, fontWeight: FontWeight.w700),
    bodyTextStyle: const PageDecoration()
        .bodyTextStyle
        .copyWith(color: mainTextColor, fontSize: 14),
    contentMargin: const EdgeInsets.all(10),
    pageColor: mainTheme,
  );
  List<PageViewModel> getPages() {
    return [
      PageViewModel(
        image: SvgPicture.asset("lib/utils/img/on_boarding_1.svg"),
        title: "Just Chill",
        bodyWidget: const Text(
          "Make your time!",
          style: onBoardingText,
        ),
        decoration: pageDecoration,
      ),
      PageViewModel(
        image: SvgPicture.asset("lib/utils/img/on_boarding_2.svg"),
        title: "Have Fun",
        bodyWidget: const Text(
          "You can watch anytime!",
          style: onBoardingText,
        ),
        decoration: pageDecoration,
      ),
      PageViewModel(
        image: SvgPicture.asset("lib/utils/img/on_boarding_3.svg"),
        title: "Have Fun",
        bodyWidget: const Text(
          "You can watch anytime!",
          style: onBoardingText,
        ),
        decoration: pageDecoration,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IntroductionScreen(
        globalBackgroundColor: mainTheme,
        pages: getPages(),
        done: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: SizedBox(
            width: 200,
            height: 40,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(primary: buttonGetStarted),
              child: const Text(
                "Get Strated",
              ),
              onPressed: () {
                Get.to(const LoginScreen());
              },
            ),
          ),
        ),
        showNextButton: false,
        dotsDecorator: DotsDecorator(
            size: const Size.square(10.0),
            activeSize: const Size(12.0, 12.0),
            activeColor: Colors.white,
            color: dotColors,
            spacing: const EdgeInsets.symmetric(horizontal: 3.0),
            activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25.0))),
        onDone: () {},
      ),
    );
  }
}
