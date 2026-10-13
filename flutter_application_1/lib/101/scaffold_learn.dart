import 'package:flutter/material.dart';
import 'package:flutter_application_1/101/conatiner_sized_boxed_learn.dart';

class ScaffoldLearnView extends StatelessWidget {
    const ScaffoldLearnView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('uygulamam')),
      body: Text('Merheba'),
      backgroundColor: Colors.red,
      extendBody: true,
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          showModalBottomSheet(
          context: context, 
          builder: (context) => Container(
            height: 200,
          ));
        },
        ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      drawer: const Drawer(),
      bottomNavigationBar: Container(
        height: 200,
        decoration: ProjectContainerDecoration(),
        child: BottomNavigationBar(items: const [
          BottomNavigationBarItem(icon: Icon(Icons.abc_outlined),label: 'a'),
          BottomNavigationBarItem(icon: Icon(Icons.abc_outlined),label: 'ba'),
        ]),
      ),
    );
  }
}
