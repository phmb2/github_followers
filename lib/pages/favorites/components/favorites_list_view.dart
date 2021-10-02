import 'package:flutter/material.dart';
import 'package:github_followers/models/follower.dart';
import 'package:github_followers/resources/colors/app_colors.dart';
import 'package:github_followers/shared/app_text_default.dart';

class FavoritesListView extends StatelessWidget {
  final List<Follower> favorites;

  const FavoritesListView({Key? key, required this.favorites}) : super(key: key);

  Widget _avatarImage(String imagePath) {
    return Container(
        height: 80,
        width: 80,
        child: Card(
          clipBehavior: Clip.antiAlias,
          child: ClipRect(
            child: Image.network(
              imagePath,
              fit: BoxFit.cover,
            ),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
          elevation: 4,
          margin: EdgeInsets.all(10.0),
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: favorites.length,
      itemBuilder: (context, index) {
        return ListTile(
          contentPadding: EdgeInsets.only(top: 16.0, right: 16.0, left: 16.0),
          title: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                border: Border.all(color: AppColors.of(context).appText),
                color: AppColors.of(context).appBackground
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                _avatarImage(favorites[index].avatarUrl),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: appTextDefault(favorites[index].login, TextAlign.left, AppColors.of(context).appText, FontWeight.bold, FontStyle.normal, 18),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
