
import 'package:flutter/material.dart';

// ignore: camel_case_types
class ColorLearn extends StatelessWidget {
  const ColorLearn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(color: Theme.of(context).colorScheme.error, child: Text('data',
      style: Theme.of(context).textTheme.titleMedium?.copyWith(color:Theme.of(context).colorScheme.error)),),
    );
  }
}

class ColorsItem {
  static final Color porchase = Color(0xffED8F61);
  static final Color sulu = Color.fromRGBO(192,237,97,1);
}

