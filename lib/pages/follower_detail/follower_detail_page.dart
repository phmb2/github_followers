import 'package:flutter/material.dart';
import 'package:github_followers/models/user.dart';
import 'package:github_followers/networking/services/user_info_service.dart';
import 'package:github_followers/resources/colors/app_colors.dart';
import 'package:github_followers/shared/app_loading.dart';
import 'package:github_followers/shared/app_text_default.dart';

import 'components/user_info.dart';

class FollowerDetailPage extends StatefulWidget {
  FollowerDetailPage({Key? key}) : super(key: key);

  @override
  _FollowerDetailPageState createState() => _FollowerDetailPageState();
}

class _FollowerDetailPageState extends State<FollowerDetailPage> {

  var userService = UserInfoService();

  late Future<User> user;

  @override
  Widget build(BuildContext context) {

    final String username = ModalRoute.of(context)!.settings.arguments as String;

    user = userService.getUserInfo(username);

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
                child: FutureBuilder<User>(
                  future: user,
                  builder: (context, snapshot) {
                    print("SNAPSHOT DATA: $snapshot");
                    if (!snapshot.hasData) {
                      return appLoading(context);
                    } else if (snapshot.hasError) {
                      return Text('${snapshot.error}');
                    } else {
                      return UserInfoWidget(
                        avatarUrl: snapshot.data!.avatarUrl,
                        login: snapshot.data!.login,
                        name: snapshot.data!.name ?? "",
                        location: snapshot.data!.location ?? "No available location",
                        bio: snapshot.data!.bio ?? "No available bio",
                        htmlUrl: snapshot.data!.htmlUrl,
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