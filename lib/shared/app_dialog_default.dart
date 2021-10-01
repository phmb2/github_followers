import 'package:flutter/material.dart';
import 'package:github_followers/resources/colors/app_colors.dart';

import 'app_text_default.dart';


class AppDialogDefault extends StatefulWidget {
  final Function onPressed;
  final String title;
  final String message;
  final String closeButton;

  const AppDialogDefault(
      { Key? key,
        required this.onPressed,
        required this.title,
        required this.message,
        required this.closeButton
      })
      : super(key: key);

  @override
  _AppDialogDefaultState createState() => _AppDialogDefaultState();
}

class _AppDialogDefaultState extends State<AppDialogDefault> {

  _closeButtonPressed() {
    Navigator.pop(context);
  }

  Widget appAlertDialogDefault(Function onPressed, String title, String message, String closeButton) {

    return AlertDialog(
      backgroundColor: AppColors.of(context).dialogBackground,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      title: appTextDefault(title, TextAlign.start, AppColors.of(context).appText.withOpacity(0.9), FontWeight.w500, FontStyle.normal, 16),
      content: SingleChildScrollView(
        child: ListBody(
          children: <Widget>[
            appTextDefault(message, TextAlign.start, AppColors.of(context).appText.withOpacity(0.9),
                FontWeight.normal, FontStyle.normal, 14),
            TextButton(
              onPressed: () {
                _closeButtonPressed();
                onPressed();
              },
              child: Padding(
                padding: EdgeInsets.only(top: 20),
                child: appTextDefault(
                    closeButton,
                    TextAlign.center,
                    AppColors.of(context).appText.withOpacity(0.9),
                    FontWeight.w500,
                    FontStyle.normal,
                    14),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
          child: appAlertDialogDefault(widget.onPressed, widget.title, widget.message, widget.closeButton)
      ),
    );
  }
}


