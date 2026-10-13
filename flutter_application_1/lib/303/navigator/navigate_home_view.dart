import 'package:flutter/material.dart';
import 'package:flutter_application_1/303/navigator/navigator_manager.dart';
import 'package:flutter_application_1/product/navigator/navigator_routes.dart';

class NavigateHomeView extends StatefulWidget {
  const NavigateHomeView({super.key});

  @override
  State<NavigateHomeView> createState() => _NavigateHomeViewState();
}

class _NavigateHomeViewState extends State<NavigateHomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.large(
        child: Icon(Icons.abc_outlined),
        onPressed: () {
          NavigatorManager.pushToPage(NavigateRoutes.detail!, arguments: "mk10");
          //Navigator.of(context).pushNamed(NavigateRoutes.detail.withParaf, arguments: "ABC");
        },
      ),
      appBar: AppBar(title: Text(toString())),
    );
  }
}
