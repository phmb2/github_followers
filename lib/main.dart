import 'package:flutter/material.dart';
import 'package:github_followers/pages/follower_detail/follower_detail_page.dart';
import 'package:github_followers/pages/follower_detail/github_profile_page.dart';
import 'package:github_followers/pages/home/home_page.dart';
import 'package:github_followers/pages/search_username/search_username_page.dart';
import 'package:github_followers/pages/splash/splash_page.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {

  static const primaryColor = Color(0xff00ACB6);

  final MaterialColor colorCustom = MaterialColor(
    primaryColor.value,
    {
      50: primaryColor.withOpacity(.1),
      100: primaryColor.withOpacity(.2),
      200: primaryColor.withOpacity(.3),
      300: primaryColor.withOpacity(.4),
      400: primaryColor.withOpacity(.5),
      500: primaryColor.withOpacity(.6),
      600: primaryColor.withOpacity(.7),
      700: primaryColor.withOpacity(.8),
      800: primaryColor.withOpacity(.9),
      900: primaryColor.withOpacity(1),
    },
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GitHub Followers',
      theme: ThemeData(
        primarySwatch: colorCustom,
        accentColor: colorCustom.shade900,
        textTheme: Theme.of(context).textTheme.apply(fontFamily: 'Roboto'),
      ),
      darkTheme: ThemeData.dark(),
      initialRoute: '/splash',
      routes: {
        '/splash': (context) => SplashPage(),
        '/search_username': (context) => SearchUsernamePage(),
        '/followers': (context) => HomePage(),
        '/follower_detail': (context) => FollowerDetailPage(),
        '/github_profile': (context) => GitHubProfilePage()
      },
    );
  }
}
