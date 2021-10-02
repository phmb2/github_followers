import 'package:flutter/material.dart';
import 'package:github_followers/resources/colors/app_colors.dart';
import 'package:github_followers/shared/app_text_default.dart';
import 'package:webview_flutter/webview_flutter.dart';

class GitHubProfilePage extends StatefulWidget {
  @override
  _GitHubProfilePageState createState() => _GitHubProfilePageState();
}

class _GitHubProfilePageState extends State<GitHubProfilePage> {

  @override
  Widget build(BuildContext context) {

    final String profileUrl = ModalRoute.of(context)!.settings.arguments as String;

    return Scaffold(
      appBar: AppBar(
        title: appTextDefault('GitHub Profile', TextAlign.center, AppColors.of(context).appText.withOpacity(0.9), FontWeight.w500, FontStyle.normal, 18),
        backgroundColor: AppColors.of(context).appBackground,
        leading: BackButton(
            color: AppColors.of(context).appText
        ),
      ),
      body: Container(
        child: Container(
          color: AppColors.of(context).appBackground,
          child: WebView(
              initialUrl: profileUrl,
              javascriptMode: JavascriptMode.unrestricted
          ),
        ),
      ),
    );
  }
}
