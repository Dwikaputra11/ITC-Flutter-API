import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tmdb_api/tmdb_api.dart';

import '../configs/config.dart';
import '../utils/colors.dart';
import '../utils/font_style.dart';
import '../widgets/upcoming_movies.dart';
import '../widgets/search_bar.dart';
import '../widgets/search_by_category.dart';
import '../widgets/top_list_movie.dart';

class DasboardScreen extends StatefulWidget {
  const DasboardScreen({ Key? key}) : super(key: key);

  @override
  State<DasboardScreen> createState() => _DasboardScreenState();
}

class _DasboardScreenState extends State<DasboardScreen> {
  List upComingMovies = [];
  List topRatedMovies = [];
  // String fullName;

  // getFromLocal() async{
  //   final spf = await SharedPreferences.getInstance();
  //   setState(() {
  //     fullName = spf.getString('fullName').toString();
  //   });
  // }

  @override
  void initState() {
    super.initState();
    // getFromLocal();
    loadMovies();
  }
  Future<void>loadMovies() async{
    try{
      TMDB tmdb = TMDB(
        ApiKeys(apiKey,accessToken),
        logConfig: ConfigLogger(
          showLogs: true,
          showErrorLogs: true,
        )
      );
      Map upComingResult = await tmdb.v3.movies.getUpcoming();
      Map topRatedResult = await tmdb.v3.movies.getTopRated();
      // print(upComingResult);
      if(mounted){
        setState(() {
          print("setState");
          upComingMovies = upComingResult['results'];
          topRatedMovies = topRatedResult['results'];
          print(upComingMovies);
          print(topRatedMovies);
        });
      }
    }catch(Exc){
      print(Exc);
      rethrow;
    }
  }
  @override
  Widget build(BuildContext context) {
  var size = MediaQuery.of(context).size;
  print("Dasboard");
  print(topRatedMovies);
  print(upComingMovies);
    return SafeArea(
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('lib/utils/img/background_dashboard.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            children: [
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          RichText(
                            text: TextSpan(
                              text: "Hello",
                              style: mainTextStyle_20,
                              children: <TextSpan>[
                                TextSpan(text: " Dwika!" , style: mainTextStyleBold_20),
                              ]
                            )
                          ),
                          Text("See Latest Movie", style: unFocusTextStyle,),
                        ],
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Container(
                          width: 65,
                          height: 65,
                          child: Image.asset('lib/utils/img/profile.jpg', fit: BoxFit.cover,),
                        ),
                      )
                    ],
                  ),
                ],
              ),
              SearchBar(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width*0.02),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Search by Category",style: mainTextStyleBold_14,),
                    Text("See more", style: unFocusTextStyle,)
                  ],
                ),
              ),
              SizedBox(height: 10,),
              SearchByCategory(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width*0.02),
                child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                    Text(
                      'Latest Movies',
                      style: mainTextStyleBold_14,
                    ),
                    Text(
                      'See more',
                      style: TextStyle(
                        color: unFocusTheme,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10,),
              LatestVideo(upcomingMovies: upComingMovies,),
              SizedBox(height: 10,),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width*0.02),
                child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                    Text(
                      'Top Now',
                      style: mainTextStyleBold_14,
                    ),
                    Text(
                      'See more',
                      style: TextStyle(
                        color: unFocusTheme,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10,),
              TopListMovie(topListMovie: topRatedMovies)
            ],
          ),
        ),
      ) 
    );
  }
}