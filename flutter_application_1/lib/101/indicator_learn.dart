import 'package:flutter/material.dart';

class IndicatorLearn extends StatelessWidget {
  const IndicatorLearn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: [CenterCircularRedProgres()]),
      body: LinearProgressIndicator(),
    );
  }
}

class CenterCircularRedProgres extends StatelessWidget {
  const CenterCircularRedProgres({super.key});
  final redColor = Colors.red;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        color: redColor,
        strokeWidth: 10,
        value: 0.5,
        backgroundColor: Colors.white,
      ),
    );
  }
}
