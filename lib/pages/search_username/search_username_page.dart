import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:github_followers/resources/colors/app_colors.dart';
import 'package:github_followers/resources/images/app_images.dart';
import 'package:github_followers/shared/app_button_default.dart';
import 'package:github_followers/shared/app_dialog_default.dart';
import 'package:github_followers/shared/app_text_form_field.dart';

class SearchUsernamePage extends StatefulWidget {
  SearchUsernamePage({Key? key}) : super(key: key);

  @override
  _SearchUsernamePageState createState() => _SearchUsernamePageState();
}

class _SearchUsernamePageState extends State<SearchUsernamePage> {

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();

  dismissKeyboard(){
    SystemChannels.textInput.invokeMethod('TextInput.hide');
  }

  String validateEmptyField(String value) {
    if (value == "") {
      return "Field cannot be empty.";
    }
    return value;
  }

  void _openDialog(bool showTitle, String title, String message) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AppDialogDefault(
              onPressed: () => {},
              title: title,
              message: message,
              closeButton: "ok".toUpperCase()
          );
        }
    );
  }

  Widget _logoImage() {
    return Container(
        margin: EdgeInsets.only(right: 40, left: 40, bottom: 70, top: 100),
        child: Image(
          image: AssetImage(AppImages.of(context).logoGitHubFollowers),
          height: 220
        )
    );
  }

  Widget _formUsername() {
    return Form(
      key: _formKey,
      child: Container(
        margin: EdgeInsets.only(top: 40, right: 40, left: 40),
        child: AppTextFormField(
          key: Key("search_username_form"),
          controller: _usernameController,
          label: "Enter a username",
          functionValidator: (value) {
            return validateEmptyField(value);
          },
          onFieldSubmitted: (value) {
            dismissKeyboard();
          },
          onChange: (value) {},
        ),
      ),
    );
  }

  Widget _getFollowersButton() {
    return Container(
      margin: EdgeInsets.only(top: 40, right: 40, left: 40),
      child: appButtonDefault(() {
        dismissKeyboard();
        if (_usernameController.text.isEmpty) {
          _openDialog(false, "Empty Username", "Please enter a username.");
        } else {
          Navigator.of(context).pushNamed('/followers', arguments: _usernameController.text);
          _usernameController.clear();
        }
      }, "Get Followers", AppColors.of(context).appButtonDefaultBackground, context),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: Key("search_username"),
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.of(context).appBackground,
      body: GestureDetector(
        onTap: () {
          dismissKeyboard();
        },
        child: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _logoImage(),
                _formUsername(),
                _getFollowersButton()
              ],
            ),
          ),
        ),
      ),
    );
  }
}