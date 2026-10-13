import 'package:flutter/material.dart';

class AppBarLearnView extends StatelessWidget {
  const AppBarLearnView({super.key});
  final String _title = 'Welcome Learn';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_title),
        leading: Icon(Icons.inbox),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.menu)),
          Center(child: CircularProgressIndicator()),
        ],
      ),

      body: Column(children: [
        ],
        ),
    );
  }
}
