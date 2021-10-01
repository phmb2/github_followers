import 'package:flutter/material.dart';
import 'package:github_followers/resources/colors/app_colors.dart';

Widget appLoading(BuildContext context) {
  return CircularProgressIndicator(
      valueColor: AlwaysStoppedAnimation<Color>(AppColors.of(context).loadingValue),
      backgroundColor: AppColors.of(context).loadingBackground,
      strokeWidth: 4
  );
}