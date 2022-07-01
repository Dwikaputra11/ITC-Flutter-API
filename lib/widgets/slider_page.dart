import 'package:final_project/utils/colors.dart';
import 'package:final_project/utils/font_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SliderPage extends StatelessWidget {
  final String title;
  final String description;
  final String image;
  const SliderPage({ Key? key,required this.image,required this.title,required this.description}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return SafeArea(
      child: Container(
        color: mainTheme,
        child: Stack(
          children: <Widget> [
            Column(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(vertical: size.height*0.03),
                  width: size.width,
                  child: SvgPicture.asset(image),
                )
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                width: size.width,
                height: size.height*0.40,
                decoration: BoxDecoration(
                  color: onBoardingMessage,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                      child: Text(title, style: onBoardingTitle,),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                      child: Text(description, style: onBoardingText,),
                    ),
                  ],
                ),
              )
              ],
            )
          ]
        )
      ),
    );
  }
}