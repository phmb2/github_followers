import 'package:flutter/material.dart';
import 'package:github_followers/models/follower.dart';
import 'follower_item_list.dart';

class FollowersGridWidget extends StatelessWidget {
  final List<Follower> followers;

  const FollowersGridWidget({Key? key, required this.followers}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
      itemCount: followers.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () => Navigator.of(context).pushNamed('/follower_detail', arguments: followers[index].login),
          child: followerItemList(followers[index].avatarUrl, followers[index].login)
        );
      },
    );
  }
}
