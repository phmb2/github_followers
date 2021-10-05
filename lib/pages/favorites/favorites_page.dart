import 'package:flutter/material.dart';
import 'package:github_followers/models/follower.dart';
import 'package:github_followers/pages/favorites/components/favorites_list_view.dart';
import 'package:github_followers/resources/colors/app_colors.dart';
import 'package:github_followers/resources/images/app_images.dart';
import 'package:github_followers/shared/app_empty_list.dart';
import 'package:github_followers/shared/app_text_default.dart';
import 'package:get_storage/get_storage.dart';
import 'package:github_followers/utils/contants.dart';

class FavoritesPage extends StatefulWidget {
  FavoritesPage({Key? key}) : super(key: key);

  @override
  _FavoritesPageState createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {

  List<Follower> favorites = [];
  final _box = GetStorage();

  @override
  void initState() {
    super.initState();
    favorites = _box.read(Constants.favorites_key) ?? [];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: appTextDefault('Favorites', TextAlign.center, AppColors.of(context).appText.withOpacity(0.9), FontWeight.w500, FontStyle.normal, 18),
        backgroundColor: AppColors.of(context).appBackground,
        leading: BackButton(
            color: AppColors.of(context).appText
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
                child: favorites.length > 0 ?
                    FavoritesListView(favorites: favorites) :
                    AppEmptyList(imagePath: AppImages.of(context).logoGitHubSplash, description: "No favorites!\nAdd one on the followers screen."))
          ],
        ),
      ),
    );
  }
}