import 'package:flutter/material.dart';
import 'package:github_followers/resources/colors/theme_dark_colors.dart';
import 'package:github_followers/resources/colors/theme_light_colors.dart';

abstract class AppColors {

  static AppColors of(BuildContext context) {
    return MediaQuery.of(context).platformBrightness == Brightness.dark ? ThemeDark() : ThemeLight();
  }

  //App Default
  Color get appBackground;
  Color get appText;

  //Loading View
  Color get loadingBackground;
  Color get loadingValue;

  //App Button Default
  Color get appButtonDefaultBackground;
  Color get appButtonDefaultTextColor;

  //App Text Form Field
  Color get inputColor;
  Color get inputError;
  Color get fontInputColor;

  //Dialog Default
  Color get dialogBackground => Color(0xff2F2F2F);
}
