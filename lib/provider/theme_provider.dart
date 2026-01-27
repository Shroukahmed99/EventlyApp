import 'package:evently_app/core/utils/themes.dart';
import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
   ThemeData themeApp = ThemeApp.LightTheme;
  void changeTheme(ThemeData currentTheme) {
    if (themeApp == currentTheme) {
      return;
    }
   themeApp = currentTheme ;
    notifyListeners();
  }

  
}
