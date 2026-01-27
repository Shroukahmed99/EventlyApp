import 'package:flutter/material.dart';

class TranslationProvider extends ChangeNotifier {
  String locale = "ar";
  void changeLocale(String currentlocale) async {
    if (locale == currentlocale) {
      return;
    }
    locale = currentlocale;
    notifyListeners();
  }
}
