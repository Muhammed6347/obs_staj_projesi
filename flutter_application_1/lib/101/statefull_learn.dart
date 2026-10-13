import 'package:flutter/material.dart';
import 'package:flutter_application_1/product/counter_hello_button.dart';
import 'package:flutter_application_1/product/language/language_items.dart';

class StatefullLearn extends StatefulWidget {
  const StatefullLearn({super.key});

  @override
  State<StatefullLearn> createState() => _StatefullLearnState();
}

class _StatefullLearnState extends State<StatefullLearn> {
  int _countValue = 0;
  

  void _updateCounter(bool isIncrement) {
    if (isIncrement) {
      _countValue = _countValue + 1;
    } else {
      _countValue = _countValue - 1;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(LanguageItems.welcomeTitle)),
      floatingActionButton: Row(mainAxisSize: MainAxisSize.min, children: [_incrementButton(), _decrementButton()]),
      body: Column(
        children: [
          Center(
            child: Text(
              _countValue.toString(),
              style: Theme.of(context).textTheme.displayLarge?.copyWith(color: Colors.red),
            ),
          ),
          const Placeholder(),
          CounterHelloButton(),
        ],
      ),
    );
  }

  FloatingActionButton _decrementButton() {
    return FloatingActionButton(
      onPressed: () {
        _updateCounter(false);
      },
      child: Icon(Icons.remove),
    );
  }

  // ignore: camel_case_types
  FloatingActionButton _incrementButton() {
    return FloatingActionButton(
      onPressed: () {
        _updateCounter(true);
      },
      child: Icon(Icons.add),
    );
  }
}
