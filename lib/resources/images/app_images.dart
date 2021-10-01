import 'package:flutter/material.dart';
import 'package:github_followers/resources/images/theme_dark_images.dart';
import 'package:github_followers/resources/images/theme_light_images.dart';

abstract class AppImages {

  static AppImages of(BuildContext context) {
    return MediaQuery.of(context).platformBrightness == Brightness.dark ? ThemeDarkImages() : ThemeLightImages();
  }

  String get logoGitHubSplash;

  String get logoGitHubFollowers;

}
