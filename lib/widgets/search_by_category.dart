import 'package:final_project/utils/colors.dart';
import 'package:final_project/utils/font_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SearchByCategory extends StatelessWidget {
  SearchByCategory({Key? key}) : super(key: key);

  List<String> _image = [
    'lib/utils/img/horror.svg',
    'lib/utils/img/actions.svg',
    'lib/utils/img/comedy.svg',
    'lib/utils/img/drama.svg',
    'lib/utils/img/romance.svg'
  ];

  List<String> _genres = [
    'Horror',
    'Actions',
    'Comedy',
    'Drama',
    'romance',
  ];

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SizedBox(
      height: 90,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: ListView.builder(
          itemCount: 5,
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          primary: false,
          itemBuilder: (context,index){
            return Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.symmetric(horizontal: size.width*0.03),
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        categoriesColor1,
                        categoriesColor2,
                      ]
                    ),
                  ),
                  child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SvgPicture.asset(_image[index]),
                    ),
                  ),
                Text(_genres[index], style: mainTextStyle_12,)
              ]
            );
          }
        )
      )
    );
  }
}