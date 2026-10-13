import 'package:flutter/material.dart';

class CustomWidgetLearn extends StatelessWidget {
  const CustomWidgetLearn({super.key});
  final String title = 'food';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: CustomFoodButton(title: title, onPressed: () {}),
              ),
            ),
          ),
          SizedBox(height: 100),
          CustomFoodButton(title: title, onPressed: () {}),
        ],
      ),
    );
  }
}

// ignore: unused_element
mixin class _ColorsUtility {
  final Color redColor = Colors.red;
  final Color whiteColor = Colors.white;
  final Color transperentColor = Colors.transparent;
}

mixin class _PaddingUtility {
  final EdgeInsets normalPadding = EdgeInsets.all(8.0);
  final EdgeInsets normal2xPadding = EdgeInsets.all(16.0);
}

// ignore: must_be_immutable
class CustomFoodButton extends StatelessWidget
    with _ColorsUtility, _PaddingUtility {
  CustomFoodButton({super.key, required this.title, required this.onPressed});
  final String title;
  void Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: redColor,
        foregroundColor: whiteColor,
        elevation: 0,
        shadowColor: transperentColor,
        shape: const StadiumBorder(),
      ),
      onPressed: onPressed,
      child: Padding(
        padding: normal2xPadding,
        child: Text(
          title,
          style: Theme.of(context).textTheme.labelSmall?.copyWith(
            color: whiteColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
