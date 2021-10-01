import 'package:flutter/material.dart';
import 'package:github_followers/pages/favorites/favorites_page.dart';
import 'package:github_followers/pages/followers/followers_page.dart';
import 'package:github_followers/resources/colors/app_colors.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int _currentScreen = 0;

  final List<Widget> _screens = [FollowersPage(), FavoritesPage()];

  final PageController pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        fixedColor: AppColors.of(context).appButtonDefaultBackground,
        backgroundColor: AppColors.of(context).appBackground,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: "My Followers",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_outline_outlined),
            label: "Favorites",
          ),
        ],
        currentIndex: _currentScreen,
        onTap: (index) => {
          setState(() {
            pageController.jumpToPage(index);
            _currentScreen = index;
          })
        },
      ),
      body: PageView(
        scrollDirection: Axis.horizontal,
        controller: pageController,
        children: _screens,
        onPageChanged: (page) {
          setState(() {
            _currentScreen = page;
          });
        },
      ),
    );
  }
}