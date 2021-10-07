import 'dart:async';

import 'package:flutter/material.dart';
import 'package:github_followers/pages/splash/components/splash_image.dart';
import 'package:github_followers/resources/colors/app_colors.dart';
import 'package:github_followers/shared/app_loading.dart';

class SplashPage extends StatefulWidget {

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  startTime() async {
    var _duration = new Duration(seconds: 3);
    return new Timer(_duration, navigationSearchLoginPage);
  }

  void navigationSearchLoginPage() {
    Navigator.of(context).pushNamed('/search_username');
  }

  @override
  void initState() {
    super.initState();
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: Key("splash_page_widget"),
      backgroundColor: AppColors.of(context).appBackground,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: imageGitHub(context),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.only(bottom: 16.0),
                child: appLoading(context),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
