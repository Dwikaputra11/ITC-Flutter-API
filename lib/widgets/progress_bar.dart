// import 'package:final_project/utils/colors.dart';
// import 'package:flutter/material.dart';
// // import 'package:provider/provider.dart';
// // import 'dart:async';

// class CostumProgressBar extends StatelessWidget {
//   final double width;
//   final int value;
//   final int totalValue;
//   const CostumProgressBar({ Key? key, required this.width, required this.value, required this.totalValue}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     double ratio = value/totalValue;
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         Stack(
//           children: <Widget>[
//             Container(
//               width: width,
//               height: 10,
//               decoration: BoxDecoration(
//                 color: mainTheme,
//                 border: Border.all(
//                   width: 1,
//                   style:  BorderStyle.solid,
//                   color: Colors.white,
//                 ),
//                 borderRadius: BorderRadius.circular(10),
//               ),
//             ),
//             Material(
//               borderRadius: BorderRadius.circular(10),
//               child: AnimatedContainer(
//                 height: 10,
//                 width: width * ratio,
//                 duration: Duration(milliseconds: 500),
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//               ),
//             )
//           ],
//         )
//       ],
//     );
//   }
// }

// class TimeState with ChangeNotifier{
//   int _time = 15;

//   int get time => _time;
//   set time(int newTime){
//     _time = newTime;
//     notifyListeners();
//   }
// }