import 'package:flutter/material.dart';
import 'package:github_followers/resources/colors/app_colors.dart';
import 'package:github_followers/shared/app_button_default.dart';
import 'package:github_followers/shared/app_text_default.dart';

class UserInfoWidget extends StatelessWidget {

  final String avatarUrl;
  final String login;
  final String name;
  final String location;
  final String bio;
  final String htmlUrl;

  const UserInfoWidget({
    Key? key,
    required this.avatarUrl,
    required this.login,
    required this.name,
    required this.location,
    required this.bio,
    required this.htmlUrl
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height * 0.7,
        decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10.0))),
        child: Column(
          children: [
            Row(
              children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 16.0, left: 16.0, bottom: 16.0),
                      child: ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          child: Image.network(avatarUrl, fit: BoxFit.cover),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: EdgeInsets.only(top: 16.0, left: 16.0, bottom: 16.0),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 6.0),
                              child: appTextDefault(login, TextAlign.left, AppColors.of(context).appText, FontWeight.bold, FontStyle.normal, 20),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 6.0),
                              child: appTextDefault(name, TextAlign.left, AppColors.of(context).appText, FontWeight.normal, FontStyle.normal, 16),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 6.0),
                              child: appTextDefault(location, TextAlign.left, AppColors.of(context).appText, FontWeight.normal, FontStyle.normal, 16),
                            ),
                          ]
                      ),
                    ),
                  ),
              ],
            ),
            Expanded(
              child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: appTextDefault(bio, TextAlign.start, AppColors.of(context).appText, FontWeight.normal, FontStyle.normal, 16),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: appButtonDefault(() {
                Navigator.of(context).pushNamed('/github_profile', arguments: htmlUrl);
              }, "GitHub Profile", context),
            ),
          ],
        ),
    );
  }
}
