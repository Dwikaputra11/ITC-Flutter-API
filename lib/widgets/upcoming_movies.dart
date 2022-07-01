import 'package:final_project/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class LatestVideo extends StatefulWidget {
  final List upcomingMovies;
  const LatestVideo({ Key? key ,required this.upcomingMovies}) : super(key: key);

  @override
  State<LatestVideo> createState() => _LatestVideoState();
}

class _LatestVideoState extends State<LatestVideo>{


  final _shimmerGradient = LinearGradient(
    colors: [
      Color(0xFFEBEBF4).withOpacity(0.4),
      Color(0xFFF4F4F4).withOpacity(0.8),
      Color(0xFFEBEBF4).withOpacity(0.4),
    ],
    stops: [
      0.1,
      0.3,
      0.4,
    ],
    begin: Alignment(-1.0, -0.3),
    end: Alignment(1.0, 0.3),
    tileMode: TileMode.clamp,
  );

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SizedBox(
      height: 120,
      child: widget.upcomingMovies.length > 0 ? ListView.builder(
        itemCount: 5,
        itemBuilder: (context,index){
          return ClipRRect(
            borderRadius:BorderRadius.circular(30),
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: size.width*0.02),
              height: 120,
              width: 120,
              decoration: BoxDecoration(
                color: backgroundList
              ),
              child: Image.network(
                "https://image.tmdb.org/t/p/w200/"+widget.upcomingMovies[index]['poster_path'],
                fit: BoxFit.fill,
              ),
            ),
          );
        },
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
      ):ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (context, index) {
          return Shimmer(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: size.width*0.02),
              height: 120,
              width: 120,
              decoration: BoxDecoration(
                color: backgroundList,
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            gradient: _shimmerGradient,
          );
        }),
    );
  }
}