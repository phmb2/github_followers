import 'package:flutter/material.dart';

Widget appTextDefault(String text, TextAlign textAlign, Color textColor, FontWeight fontWeight, FontStyle fontStyle, double fontSize, [String keyTag = ""]) {
  return Text(
      text,
      key: Key(keyTag),
      textAlign: textAlign,
      style: TextStyle(
          color: textColor,
          fontWeight: fontWeight,
          fontStyle: fontStyle,
          fontFamily: 'Roboto',
          fontSize: fontSize
      )
  );
}
