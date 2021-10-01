import 'package:flutter/material.dart';
import 'package:github_followers/resources/colors/app_colors.dart';
import 'app_text_default.dart';

class AppEmptyList extends StatefulWidget {
  final String? keyTag;
  final String imagePath;
  final String description;

  const AppEmptyList({ Key? key, this.keyTag, required this.imagePath, required this.description })
      : super(key: key);

  @override
  _AppEmptyListState createState() => _AppEmptyListState();
}

class _AppEmptyListState extends State<AppEmptyList> {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: Image(
                  height: 0.4 * MediaQuery.of(context).size.height,
                  width: 0.5 * MediaQuery.of(context).size.width,
                  image: AssetImage(widget.imagePath)),
            ),
            Container(
              margin: EdgeInsets.only(top: 24, right: 16, left: 16),
              child: appTextDefault(widget.description, TextAlign.center, AppColors.of(context).appText.withOpacity(0.9), FontWeight.w700, FontStyle.normal, 22),
            ),
          ],
        ),
      ),
    );
  }
}
