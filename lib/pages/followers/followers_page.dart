import 'package:flutter/material.dart';
import 'package:github_followers/models/follower.dart';
import 'package:github_followers/networking/services/followers_service.dart';
import 'package:github_followers/resources/colors/app_colors.dart';
import 'package:github_followers/resources/images/app_images.dart';
import 'package:github_followers/shared/app_empty_list.dart';
import 'package:github_followers/shared/app_loading.dart';
import 'package:github_followers/shared/app_text_default.dart';

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

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    final String username = ModalRoute.of(context)!.settings.arguments as String;

    followers = followersService.getFollowers(username, page);

    return Scaffold(
      appBar: AppBar(
        title: appTextDefault(username, TextAlign.center, AppColors.of(context).appText.withOpacity(0.9), FontWeight.w500, FontStyle.normal, 18),
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