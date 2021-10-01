import 'dart:convert';

import 'package:github_followers/models/user.dart';
import 'package:github_followers/networking/core/config.dart';
import 'package:http/http.dart' as http;

class UserInfoService {

  Future<User> getUserInfo(String username) async {
    final response = await http.get(Uri.parse(GitHubFollowersConfig.baseUrl + "$username"));
    if (response.statusCode == 200) {
      return User.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Deu erro!!');
    }
  }

}
