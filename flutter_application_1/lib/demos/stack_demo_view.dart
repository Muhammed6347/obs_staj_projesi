import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/random_image.dart';

class StackDemoView extends StatelessWidget {
  const StackDemoView({super.key});
  final _cardHeight = 50.0;
  final _cardWidth = 200.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Expanded(
            flex: 4,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Positioned.fill(bottom: _cardHeight / 2, child: RandomImage()),
                Positioned(height: _cardHeight, bottom: 0, width: _cardWidth, child: _cardCustom()),
              ],
            ),
          ),
          Spacer(flex: 6),
        ],
      ),
    );
  }
}

// ignore: camel_case_types
Card _cardCustom() {
  return Card(color: Colors.white, shape: RoundedRectangleBorder());
}
