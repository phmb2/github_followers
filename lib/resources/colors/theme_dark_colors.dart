import 'package:flutter/material.dart';
import 'app_colors.dart';

class ThemeDark extends AppColors {

  //App Default
  Color get appBackground => Color(0xFF121212);
  Color get appText => Colors.white;

  //Loading View
  Color get loadingBackground => Colors.white;
  Color get loadingValue => Colors.black;

  //App Button Default
  Color get appButtonDefaultBackground => Color(0xFF53B175);
  Color get appButtonPurpleBackground => Color(0xFFA020F0);
  Color get appButtonDefaultTextColor => Colors.white;

  //App Text Form Field
  Color get inputColor => Colors.white;
  Color get inputError => Color(0xFFB00020);
  Color get fontInputColor => Color(0xFF212121);

  //Dialog Default
  Color get dialogBackground => Color(0xFF2F2F2F);
}