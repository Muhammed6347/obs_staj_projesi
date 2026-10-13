import 'package:flutter/material.dart';

class ThemeNotifer extends ChangeNotifier {
  bool isLightFalse = false;

  void changeTheme() {
    isLightFalse = !isLightFalse;
    notifyListeners();
  }

  ThemeData get currentTheme => !isLightFalse ? ThemeData.light() : ThemeData.dark();
}
