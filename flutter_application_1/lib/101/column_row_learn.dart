import 'package:flutter/material.dart';

class ColumnRowLearn extends StatelessWidget {
  const ColumnRowLearn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          //4+2+2+2
          Expanded(
            flex: 4, //%40
            child: Row(
              children: [
                Expanded(child: Container(color: Colors.red)),
                Expanded(child: Container(color: Colors.black)),
                Expanded(child: Container(color: Colors.blue)),
                Expanded(child: Container(color: Colors.purpleAccent)),
              ],
            ),
          ),
          Spacer(flex: 2),
          Expanded(
            flex: 2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [Text('a1'), Text('a2'), Text('a3')],
            ),
          ),
          SizedBox(
            height: ProjectContainerSizes.cardHeight,
            child: Column(
              children: [
                Expanded(child: Text('data')),
                Expanded(child: Text('data')),
                Expanded(child: Text('data')),
                Spacer(),
                Expanded(child: Text('data')),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ProjectContainerSizes {
  static const double cardHeight = 200;
}
