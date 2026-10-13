import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/random_image.dart';

class ListTileLearn extends StatelessWidget {
  const ListTileLearn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: [
            Card(
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: ListTile(
                  title: RandomImage(),
                  contentPadding: EdgeInsets.zero,
                  onTap: () {},
                  subtitle: Text('How do you use your card'),
                  minVerticalPadding: 0,
                  dense: true,
                  leading: Container(
                    height: 100,
                    width: 30,
                    alignment: Alignment.topCenter,
                    color: Colors.red,
                    child: Icon(Icons.money),
                  ),
                  trailing: SizedBox(
                    width: 10,
                    child: Icon(Icons.chevron_right),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
