import 'package:flutter/material.dart';

class WidgetSizeEnumLearnView extends StatefulWidget {
  const WidgetSizeEnumLearnView({super.key});

  @override
  State<WidgetSizeEnumLearnView> createState() => _WidgetSizeEnumLearnViewState();
}

class _WidgetSizeEnumLearnViewState extends State<WidgetSizeEnumLearnView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Card(
        child: Container(height: WidgetSize.normalCardWeight.value(), color: Colors.green),
      ),
    );
  }
}

enum WidgetSize { normalCardWeight, circleProfileWidth }

extension WidgetSizeExtension on WidgetSize {
  double value() {
    switch (this) {
      case WidgetSize.normalCardWeight:
        return 30;
      case WidgetSize.circleProfileWidth:
        return 25;
    }
  }
}
