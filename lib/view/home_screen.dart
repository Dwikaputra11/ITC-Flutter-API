import 'package:final_project/configs/config.dart';
import 'package:final_project/utils/colors.dart';
import 'package:final_project/view/dashboard_screen.dart';
import 'package:final_project/view/favorite_screen.dart';
import 'package:final_project/view/profile_screen.dart';
import 'package:final_project/view/recent_watching_screen.dart';
import 'package:final_project/view/search_screen.dart';
import 'package:final_project/widgets/upcoming_movies.dart';
import 'package:final_project/widgets/search_by_category.dart';
import 'package:final_project/widgets/top_list_movie.dart';
import 'package:flutter/material.dart';
import 'package:tmdb_api/tmdb_api.dart';

import '../utils/font_style.dart';

class HomeScreen extends StatefulWidget {
  final String email;
  const HomeScreen({ Key? key , required this.email}): super(key: key);
  getEmail() => email;
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  PageController controller = PageController();


  void onTap(int index){
    setState(() {
      _selectedIndex = index;
    });
    controller.jumpToPage(index);
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      extendBody: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text("JustWatch.", style: titleAppBar,),
        elevation: 0,
        leading: Builder(
          builder: (context){
          return IconButton(
              icon: const Icon(
                Icons.menu,
              ),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          }
        ) 
      ),
      body: PageView(
        controller: controller,
        children: [
          DasboardScreen(),
          FavoriteScreen(),
          SearchScreen(),
          RecentWatch(),
          ProfileScreen(),
        ]
      ),
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight:Radius.circular(20)),
        child: Theme(
          data: Theme.of(context).copyWith(
          canvasColor: Color(0xFFE9E9E9).withOpacity(0.2),
          primaryColor: Colors.red,
          textTheme: Theme
              .of(context)
              .textTheme
              .copyWith(caption: new TextStyle(color: Colors.yellow))),
          child: BottomNavigationBar(
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(icon: _selectedIndex == 0 ? Icon(Icons.home):Icon(Icons.home_outlined), label: "Home",),
              BottomNavigationBarItem(icon: _selectedIndex == 1 ? Icon(Icons.favorite):Icon(Icons.favorite_outline), label: "Favorite",),
              BottomNavigationBarItem(icon: Icon(Icons.search),label: "Search",),
              BottomNavigationBarItem(icon: Icon(Icons.tv), label: "Recent Watch",),
              BottomNavigationBarItem(icon: _selectedIndex == 4 ? Icon(Icons.person):Icon(Icons.person_outline), label: "Profile", ),
            ],
            currentIndex: _selectedIndex,
            selectedItemColor: Color(0xFF686E8B),
            unselectedItemColor: Color(0xFF686E8B),
            onTap: onTap,
          ),
        ),
      ),
    );
  }
}