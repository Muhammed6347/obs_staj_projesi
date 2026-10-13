import 'package:flutter/material.dart';

class PaddingLearn extends StatelessWidget {
  const PaddingLearn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: ProjectPadding.pagePaddingVertical,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Container(color: Colors.white, height: 100),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
              child: Container(
                padding: EdgeInsets.zero,
                color: Colors.white,
                height: 100,
              ),
            ),
            Padding(
              padding:
                  ProjectPadding.pagePaddingRightOnly +
                  ProjectPadding.pagePaddingVertical,
              child: Text('ali'),
            ),
          ],
        ),
      ),
    );
  }
}

class ProjectPadding {
  static final pagePaddingVertical = const EdgeInsets.symmetric(vertical: 10);
  static final pagePaddingRightOnly = const EdgeInsets.only(right: 20);
}
