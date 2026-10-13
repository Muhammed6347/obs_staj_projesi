import 'package:flutter/material.dart';
import 'package:flutter_application_1/101/icon_learn.dart';
import 'package:flutter_application_1/101/image_learn.dart';
import 'package:flutter_application_1/101/stack_learn.dart';

class PageViewLearn extends StatefulWidget {
  const PageViewLearn({super.key});

  @override
  State<PageViewLearn> createState() => _PageViewLearnState();
}

class _PageViewLearnState extends State<PageViewLearn> {
  // ignore: non_constant_identifier_names
  final _PageController = PageController(viewportFraction: 0.7);
  // ignore: unused_field
  int _curentPageIndex = 0;
  void _updatePageIndex(int index) {
    setState(() {
      _curentPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Row(
        children: [
          Padding(padding: const EdgeInsets.only(left: 20), child: Text(_curentPageIndex.toString())),
          Spacer(),
          FloatingActionButton(
            onPressed: () {
              _PageController.previousPage(duration: _DurationUtility._durationLow, curve: Curves.slowMiddle);
            },
            child: Icon(Icons.chevron_left),
          ),
          FloatingActionButton(
            onPressed: () {
              _PageController.nextPage(duration: _DurationUtility._durationLow, curve: Curves.slowMiddle);
            },
            child: Icon(Icons.chevron_right),
          ),
        ],
      ),
      appBar: AppBar(),
      body: PageView(
        padEnds: false,
        controller: _PageController,
        onPageChanged: _updatePageIndex,
        children: [ImageLearn(), IconLearnView(), StackLearn()],
      ),
    );
  }
}

class _DurationUtility {
  static const _durationLow = Duration(seconds: 1);
}
