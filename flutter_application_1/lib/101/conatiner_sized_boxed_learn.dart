import 'package:flutter/material.dart';

class ConatinerSizedBoxedLearn extends StatelessWidget {
  const ConatinerSizedBoxedLearn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          SizedBox(
            width: 300,
            height: 200,
            child: Text(List.filled(500, 'a').join()),
          ),
          SizedBox.shrink(),
          SizedBox.square(
            dimension: 50,
            child: Text(List.filled(50, 'b').join()),
          ),
          Container(
            height: 50,
            constraints: BoxConstraints(
              maxWidth: 150,
              minWidth: 100,
              maxHeight: 100,
            ),
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.all(10),
            decoration: ProjectUtility.boxDecoration,
            child: Text('cc'),
          ),
        ],
      ),
    );
  }
}

class ProjectUtility {
  static BoxDecoration boxDecoration = BoxDecoration(
    borderRadius: BorderRadius.circular(10),
    gradient: const LinearGradient(colors: [Colors.red, Colors.black]),
    boxShadow: [BoxShadow(color: Colors.green, offset: Offset(0.1, 1))],
    border: Border.all(width: 10, color: Colors.white12),
  );
}

class ProjectContainerDecoration extends BoxDecoration {
  ProjectContainerDecoration()
    : super(
        borderRadius: BorderRadius.circular(10),
        gradient: const LinearGradient(colors: [Colors.red, Colors.black]),
        boxShadow: [BoxShadow(color: Colors.green, offset: Offset(0.1, 1))],
        border: Border.all(width: 10, color: Colors.white12),
      );
}
