import 'package:flutter/material.dart';

class CardLearn extends StatelessWidget {
  const CardLearn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Card(
            margin: ProjectMargins.cardMargin,
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: const SizedBox(
              height: 100,
              width: 200,
              child: Center(child: Text('Ali')),
            ),
          ),
          Card(
            margin: ProjectMargins.cardMargin,
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: const SizedBox(
              height: 100,
              width: 200,
              child: Center(child: Text('Ali')),
            ),
          ),
          _CustomCard(
            child: const SizedBox(
              height: 100,
              width: 200,
              child: Center(child: Text('Ali')),
            ),
          ),
        ],
      ),
    );
  }
}

class ProjectMargins {
  static const cardMargin = EdgeInsets.all(10);
}

class _CustomCard extends StatelessWidget {
  _CustomCard({required this.child});
  final Widget child;
  final roundedRectangleBorder = RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(20),
  );
  @override
  Widget build(BuildContext context) {
    var card = Card(
      margin: ProjectMargins.cardMargin,
      shape: roundedRectangleBorder,
      child: child,
    );
    return card;
  }
}


//borders
 //StadiumBorder(),RoundedRectangleBorder(),CircleBorder()