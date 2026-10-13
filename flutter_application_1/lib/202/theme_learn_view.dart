import 'package:flutter/material.dart';
import 'package:flutter_application_1/demos/password_text_field.dart';

class ThemeLearnView extends StatefulWidget {
  const ThemeLearnView({super.key});

  @override
  State<ThemeLearnView> createState() => _ThemeLearnViewState();
}

class _ThemeLearnViewState extends State<ThemeLearnView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          PasswordTextField(controller: null),
          CheckboxListTile(value: true, onChanged: (val) {}, title: Text('select')),
        ],
      ),
    );
  }
}
