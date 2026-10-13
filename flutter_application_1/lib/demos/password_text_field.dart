import 'package:flutter/material.dart';

class PasswordTextField extends StatefulWidget {
  const PasswordTextField( {super.key, required this.controller});
  final TextEditingController? controller;

  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  final _obscureText = '#';

  bool _isSecure = true;

  // ignore: unused_element
  void _changeLoading() {
    setState(() {
      _isSecure = !_isSecure;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      autofillHints: [AutofillHints.password],
      keyboardType: TextInputType.visiblePassword,
      obscureText: _isSecure,
      obscuringCharacter: _obscureText,
      decoration: InputDecoration(
        border: UnderlineInputBorder(),
        hintText: "password",
        suffix: _onVisibilityIcon(),
      ),
    );
  }
}
// Sınıfın içine şöyle bir metot ekle:
IconButton _onVisibilityIcon() {
  return IconButton(
    onPressed: () {
      // işlemlerin
    },
    icon: Icon(Icons.visibility),
  );
}