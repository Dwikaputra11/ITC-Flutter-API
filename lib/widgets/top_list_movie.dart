import 'package:final_project/utils/font_style.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../utils/colors.dart';

class TopListMovie extends StatefulWidget {
  final List topListMovie;
  const TopListMovie({ Key? key, required this.topListMovie}) : super(key: key);

  @override
  State<TopListMovie> createState() => _TopListMovieState();
}

class _TopListMovieState extends State<TopListMovie> {
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
  
  int maximumRating = 5;
  int _currentMovieRating = 0;
  Widget _buildRatingStar(int index, indexMovie){
    double cur = (widget.topListMovie[indexMovie]['vote_average']/2);
    _currentMovieRating = cur.floor() - 1;
    if(index <= _currentMovieRating){
      return Icon(Icons.star, color: Colors.orange,size: 20);
    }else{
      return Icon(Icons.star_outline_outlined, color: unFocusTheme,size: 20);
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SizedBox(
      height: 250,
      child: widget.topListMovie.length > 0 ? ListView.builder(
        itemCount: 5,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context,index){
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width*0.03),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Container(
                    height: 170,
                    width: 120,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: backgroundList
                    ),
                    child: Image.network(
                      "https://image.tmdb.org/t/p/w200/"+widget.topListMovie[index]['poster_path'],
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Container(
                    width: 100,
                    child: Text(
                      widget.topListMovie[index]['title'].toString().length > 12 ? 
                      "${widget.topListMovie[index]['title'].toString().substring(0,10)}...":
                      widget.topListMovie[index]['title'],
                      style: mainTextStyleBold_14,)),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(widget.topListMovie[index]['vote_average'].toString(), style: unFocusTextStyle,),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5.0),
                  child: Row(
                    children: List<Widget>.generate(maximumRating, (i) {
                        return _buildRatingStar(i,index);
                    })
                  ),
                )
              ],  
            ),
          ); 
        },
      ):ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (context,index){
          return Shimmer(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width*0.03),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: Container(
                      height: 170,
                      width: 120,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: backgroundList
                      ),
                    ),
                  ),
                ]
              ),
            ),
            gradient: _shimmerGradient
          );
        },
      )
    );
  }
}