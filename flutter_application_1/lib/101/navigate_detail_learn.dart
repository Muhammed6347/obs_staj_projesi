import 'package:flutter/material.dart';

class NavigateDetailLearn extends StatefulWidget {
  const NavigateDetailLearn({super.key, this.isOk = false});
  final bool isOk;

  @override
  State<NavigateDetailLearn> createState() => _NavigateDetailLearnState();
}

class _NavigateDetailLearnState extends State<NavigateDetailLearn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: ElevatedButton.icon(
          onPressed: () {
            Navigator.of(context).pop(!widget.isOk);
          },
          icon: Icon(widget.isOk ? Icons.close : Icons.check, color: widget.isOk ? Colors.red : Colors.green),
          label: Text(widget.isOk ? 'Red' : 'Onayla'),
        ),
      ),
    );
  }
}
