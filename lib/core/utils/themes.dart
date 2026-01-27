import 'package:evently_app/core/constants/app_colors.dart';
import 'package:evently_app/core/constants/app_styles.dart';
import 'package:evently_app/provider/theme_provider.dart';
import 'package:flutter/material.dart';

class ThemeApp {
  ThemeProvider themeProvider =ThemeProvider();
  


  static ThemeData LightTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.whiteBgColor,
    textTheme: TextTheme(
      headlineLarge: AppStyles.medium16Black,
    ),
    
  );
  static ThemeData DarkTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.primaryDark,
    textTheme: TextTheme(
      headlineLarge: AppStyles.medium16White,
    ),
  );
}
