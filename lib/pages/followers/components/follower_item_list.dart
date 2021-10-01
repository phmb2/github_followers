

import 'package:flutter/material.dart';

Widget followerItemList(String avatarUrl, String login) {
  return Container(
    child: Column(
      children: [
        _imageCard(avatarUrl),
        Text(login)
      ],
    ),
  );
}

Widget _imageCard(String imagePath) {
  return Container(
      height: 120,
      width: 120,
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