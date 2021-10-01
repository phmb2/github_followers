import 'dart:convert';

import 'package:github_followers/models/follower.dart';
import 'package:github_followers/networking/core/config.dart';
import 'package:http/http.dart' as http;

class FollowersService {

  Future<List<Follower>> getFollowers(String username, int page) async {
    final response = await http.get(Uri.parse(GitHubFollowersConfig.baseUrl + "$username/followers?per_page=100&page=($page)"));

    if (response.statusCode == 200) {
      Iterable list = jsonDecode(response.body);
      return list.map((follower) => Follower.fromJson(follower)).toList();
    } else {
      throw Exception('Deu erro!!');
    }
  }

}
