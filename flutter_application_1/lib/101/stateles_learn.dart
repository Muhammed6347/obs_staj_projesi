import 'package:flutter/material.dart';

class StatelesLearn extends StatelessWidget {
  const StatelesLearn({super.key});

  @override
  Widget build(BuildContext context) {
  final muhammed = 'Muhammed';
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          TittleTextWidget(text: muhammed),
          TittleTextWidget(text: 'Muhammed2'),
          _CustomContainer(),
          _emptyBox(),
        ],
      ),
    );
  }
}

// ignore: camel_case_types
class _emptyBox extends StatelessWidget {
  const _emptyBox();

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: 10);
  }
}

class _CustomContainer extends StatelessWidget {
  const _CustomContainer();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.red,
      ),
    );
  }
}

extension on TextTheme {
  TextStyle? get headLine3 => null;
}

// ignore: must_be_immutable
class TittleTextWidget extends StatelessWidget {
  TittleTextWidget({super.key, required this.text});
  String text;
  @override
  Widget build(BuildContext context) {
    return Text(text, style: Theme.of(context).textTheme.headLine3);
  }
}
