import 'package:flutter/material.dart';
import 'package:project_starter/app/theme/styles.dart';
import 'app_colors.dart';

class AppTheme {
  static final theme = ThemeData(
    fontFamily: 'Poppins',
    scaffoldBackgroundColor: AppColors.scaffoldColor,
    primaryColor: AppColors.primaryColor,
    appBarTheme: AppBarTheme(
      scrolledUnderElevation: 0,
      centerTitle: false,
      elevation: 0,
      backgroundColor: AppColors.scaffoldColor,
      titleTextStyle: Styles.tsBlackTextColorSemiBold16,
    ),
  );
}
