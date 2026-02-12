
import 'package:evently_app/config/themes/theme%20provider/theme_provider.dart';
import 'package:evently_app/core/utils/app_colors.dart';
import 'package:evently_app/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class ThemeApp {
  ThemeProvider themeProvider =ThemeProvider();


 static ThemeData LightTheme = ThemeData(
  focusColor: AppColors.whiteColor,
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: AppColors.primaryLight,
    
  
    
    
    shape: StadiumBorder(
side: BorderSide(
  color: AppColors.whiteColor,
  width: 4,
),
    ),
  ),
  primaryColor: AppColors.primaryLight,
   iconTheme: IconThemeData(
      color: AppColors.greyColor
    ),

    scaffoldBackgroundColor: AppColors.whiteBgColor,
    inputDecorationTheme: InputDecorationTheme(
      enabledBorder:OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.greyColor),
      ),
       focusedBorder:OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.greyColor),
      )
    ),
    

    textTheme: TextTheme(

      headlineLarge: AppStyles.medium16Black,
      bodyLarge: AppStyles.medium16White,
        bodySmall: AppStyles.medium16Primary,
      bodyMedium: AppStyles.medium14Grey

    ),
    
  );
  static ThemeData DarkTheme = ThemeData(
     focusColor: AppColors.primaryLight,

     floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: AppColors.primaryDark,
    shape: StadiumBorder(
side: BorderSide(
  color: AppColors.whiteColor,
  width:4,
),
    ),
  ),
    
 primaryColor: AppColors.primaryDark,
    scaffoldBackgroundColor: AppColors.primaryDark,
    iconTheme: IconThemeData(
      color: AppColors.semiWhite
    ),
     inputDecorationTheme: InputDecorationTheme(
      enabledBorder:OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.primaryLight),
      ),
       focusedBorder:OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.primaryLight),
      )
    ),

    textTheme: TextTheme(

      headlineLarge: AppStyles.medium16White,
       bodyMedium: AppStyles.medium14SemiWhite,
        bodyLarge: AppStyles.medium16White,
        bodySmall: AppStyles.medium16White,

    ),

  );
  
}
