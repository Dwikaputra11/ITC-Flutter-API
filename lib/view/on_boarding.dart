import 'package:final_project/utils/colors.dart';
import 'package:final_project/utils/font_style.dart';
import 'package:final_project/view/home_screen.dart';
import 'package:final_project/view/login_screeen.dart';
import 'package:final_project/widgets/slider_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';


class OnBoarding extends StatefulWidget {
  const OnBoarding({ Key? key }) : super(key: key);

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  int _currentPage = 0;
  PageController _controller = PageController();

  List<Widget> _pages =[
    SliderPage(
      title: "How To Know",
      description: "Lorem ipsum dolor sit amet consectetur adipiscing elit.Lorem ipsum dolor sit amet,consectetur adipiscing elit.",
      image: "lib/utils/img/on_boarding_1.svg",
    ),
    SliderPage(
      title: "How To Know",
      description: "Lorem ipsum dolor sit amet consectetur adipiscing elit.Lorem ipsum dolor sit amet,consectetur adipiscing elit.",
      image: "lib/utils/img/on_boarding_2.svg",
    ),
    SliderPage(
      title: "How To Know",
      description: "Lorem ipsum dolor sit amet consectetur adipiscing elit.Lorem ipsum dolor sit amet,consectetur adipiscing elit.",
      image: "lib/utils/img/on_boarding_3.svg",
    ),
  ]; 

  _onChanged(int index){
    setState(() {
      _currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: () async{
        return false;
      },
      child: Scaffold(
          body: Stack(
            children: <Widget>[
              PageView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: _pages.length,
                controller: _controller,
                onPageChanged: _onChanged,
                itemBuilder: (context, index){
                  return _pages[index];
                }
              ),
              Padding(
                padding: EdgeInsets.only(top: size.height*0.1),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List<Widget>.generate(_pages.length, (index){
                        return AnimatedContainer(
                          duration: Duration(milliseconds: 300),
                          height: (index == _currentPage) ? 10:8,
                          width: (index == _currentPage) ? 10:8,
                          margin: EdgeInsets.symmetric(horizontal: 5, vertical: 30),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: (index == _currentPage) ? Colors.white : Colors.white.withOpacity(0.5)
                          ),
                        );
                      })
                    )
                  ],
                ),
              ),
              (_currentPage == _pages.length - 1) ? 
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(
                      onTap: () {
                        Get.to(LoginScreen());
                      },
                      child: Center(
                        child: Container(
                          margin: const EdgeInsets.only(bottom: 10),
                          width: size.width*0.5,
                          height: size.height*0.06,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: buttonGetStarted,
                          ),
                          child: Center(child: Text("Get Started",style: onBoardingText)),
                        ),
                      ),
                    ),
                  ],
                ) : Container(),
            ],
          ),
      ),
    );
  }
}