import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:github_followers/models/follower.dart';
import 'package:github_followers/models/user.dart';
import 'package:github_followers/networking/services/followers_service.dart';
import 'package:github_followers/networking/services/user_info_service.dart';
import 'package:github_followers/resources/colors/app_colors.dart';
import 'package:github_followers/resources/images/app_images.dart';
import 'package:github_followers/shared/app_dialog_default.dart';
import 'package:github_followers/shared/app_empty_list.dart';
import 'package:github_followers/shared/app_loading.dart';
import 'package:github_followers/shared/app_text_default.dart';
import 'package:github_followers/utils/contants.dart';
import 'components/followers_grid.dart';

class FollowersPage extends StatefulWidget {
  FollowersPage({Key? key}) : super(key: key);

  @override
  _FollowersPageState createState() => _FollowersPageState();
}

class _FollowersPageState extends State<FollowersPage> {

  var followersService = FollowersService();
  late Future<List<Follower>> followers;
  var page = 1;

  var userService = UserInfoService();
  User? user;
  List<Follower> favorites = [];

  final _box = GetStorage();
  bool? isFavorite;

  void _openDialog(bool showTitle, String title, String message, String messageButton) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AppDialogDefault(
              onPressed: () => {},
              title: title,
              message: message,
              closeButton: messageButton.toUpperCase()
          );
        }
    );
  }

  @override
  void initState() {
    super.initState();
    favorites = _box.read(Constants.favorites_key) ?? [];
    isFavorite = _box.read(Constants.is_favorite_key) ?? false;
  }

  @override
  void dispose() {
    super.dispose();
    _box.write(Constants.is_favorite_key, isFavorite!);
  }

  @override
  Widget build(BuildContext context) {

    final String username = ModalRoute.of(context)!.settings.arguments as String;

    userService.getUserInfo(username).then((value) => {
      user = value
    }, onError: (error) => {
      throw Exception('Error: $error')
    });

    followers = followersService.getFollowers(username, page);

    return Scaffold(
      appBar: AppBar(
        title: appTextDefault(username, TextAlign.center, AppColors.of(context).appText.withOpacity(0.9), FontWeight.w500, FontStyle.normal, 18),
        backgroundColor: AppColors.of(context).appBackground,
        leading: BackButton(
            color: AppColors.of(context).appText
        ),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                isFavorite = !isFavorite!;
                if (isFavorite!) {
                  var favorite = Follower(login: user!.login, avatarUrl: user!.avatarUrl);
                  favorites.add(favorite);
                  _openDialog(false, "Success", "You have successfully favorited this user.", "success");
                } else {
                  favorites.removeWhere((element) => element.login == user!.login);
                }
                _box.write(Constants.favorites_key, favorites);
              });
            },
            icon: isFavorite == false ?
              Icon(Icons.favorite_outline_outlined, color: AppColors.of(context).appText) :
              Icon(Icons.favorite_outlined, color: AppColors.of(context).favoriteIcon),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              child: FutureBuilder<List<Follower>>(
                future: followers,
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return appLoading(context);
                  } else if (snapshot.hasError) {
                    return Text('${snapshot.error}');
                  } else {
                    return Expanded(
                      child: snapshot.data!.length > 0 ?
                      FollowersGridWidget(followers: snapshot.data!) :
                      AppEmptyList(imagePath: AppImages.of(context).logoGitHubSplash, description: "This user doesn't have a followers."),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}