import 'package:flutter/material.dart';
import 'package:github_followers/resources/colors/app_colors.dart';
import 'package:github_followers/resources/images/app_images.dart';
import 'package:github_followers/shared/app_empty_list.dart';
import 'package:github_followers/shared/app_text_default.dart';

class FavoritesPage extends StatefulWidget {
  FavoritesPage({Key? key}) : super(key: key);

  @override
  _FavoritesPageState createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: appTextDefault('Favorites', TextAlign.center, AppColors.of(context).appText.withOpacity(0.9), FontWeight.w500, FontStyle.normal, 18),
        backgroundColor: AppColors.of(context).appBackground,
        elevation: 0,
        leading: BackButton(
            color: AppColors.of(context).appText
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(child: AppEmptyList(imagePath: AppImages.of(context).logoGitHubSplash, description: "No favorites!\nAdd one on the followers screen."))
          ],
        ),
      ),
    );
  }
}