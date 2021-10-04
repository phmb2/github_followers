import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:github_followers/resources/colors/app_colors.dart';
import 'app_text_default.dart';

Widget appButtonDefault(VoidCallback onPressed, String labelText, Color backgroundColor, BuildContext context, [String keyTag = ""]) {
  return Container(
    height: 48,
    width: double.infinity,
    child: MaterialButton(
      key: Key(keyTag),
      onPressed: onPressed,
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: appTextDefault(
        labelText.toUpperCase(),
        TextAlign.center,
        AppColors.of(context).appButtonDefaultTextColor,
        FontWeight.w500,
        FontStyle.normal,
        14,
      ),
      color: backgroundColor,
    ),
  );
}
