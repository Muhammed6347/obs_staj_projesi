import 'package:flutter/material.dart';

class TextLearnView extends StatelessWidget {
  const TextLearnView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
    body: Center(
      child: Text (
        ('veli,495' ),
        maxLines: 2,
        style: TextStyle(wordSpacing: 10, 
        letterSpacing: 10,
        fontSize: 30,fontWeight: FontWeight.w600
        ),
        )), 
    );
  }
}
