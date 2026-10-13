import 'package:flutter/material.dart';

class LightTheme {
  final _lightColor = _LightColor();
  late final ThemeData theme;

  LightTheme() {
    theme = ThemeData(
      appBarTheme: AppBarTheme(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(bottom: Radius.circular(20))),
        backgroundColor: Colors.amber,
      ),
      scaffoldBackgroundColor: Colors.grey,

      floatingActionButtonTheme: FloatingActionButtonThemeData(backgroundColor: Colors.green),
      buttonTheme: ButtonThemeData(
        colorScheme: ColorScheme.light(onPrimary: Colors.red, onSecondary: _lightColor.buttonColor),
      ),
      checkboxTheme: CheckboxThemeData(
        fillColor: WidgetStateProperty.all(Colors.green),
        side: BorderSide(color: Colors.green),
      ),

      colorScheme: ColorScheme.light(),
      textTheme: ThemeData.light().textTheme.copyWith(
        bodyLarge: TextStyle(fontSize: 25, color: _lightColor._textColor),
      ),
    );
  }
}

class _LightColor {
  final Color _textColor = Color.fromARGB(255, 190, 97, 97);
  final Color buttonColor = Color.fromARGB(255, 157, 25, 83);
}
