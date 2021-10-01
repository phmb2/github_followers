import 'package:flutter/material.dart';
import 'app_colors.dart';

class ThemeLight extends AppColors {

  //App Default
  Color get appBackground => Colors.white;
  Color get appText => Color(0xFF121212);

  //Loading View
  Color get loadingBackground => Colors.black;
  Color get loadingValue => Colors.white;

  //App Button Default
  Color get appButtonDefaultBackground => Color(0xFF53B175);
  Color get appButtonDefaultTextColor => Colors.white;

  //App Text Form Field
  Color get inputColor => Color(0xFF212121);
  Color get inputError => Color(0xFFB00020);
  Color get fontInputColor => Colors.white;

  //Dialog default
  Color get dialogBackground => Colors.white;
}