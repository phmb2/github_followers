import 'package:flutter/material.dart';
import 'package:github_followers/resources/images/app_images.dart';

Widget imageGitHub(BuildContext context) {
  return Container(
    margin: EdgeInsets.only(right: 40, left: 40, top: 20),
    child: Image(
      image: AssetImage(AppImages.of(context).logoGitHubSplash),
      height: 280,
      width: 280
    )
  );
}
