import 'package:flutter/material.dart';
import 'package:flutter_application_1/202/packace/launch_mixin.dart';
import 'package:flutter_application_1/202/packace/loading_bar.dart';

class PackaceLearnView extends StatefulWidget {
  const PackaceLearnView({super.key});

  @override
  State<PackaceLearnView> createState() => _PackaceLearnViewState();
}

class _PackaceLearnViewState extends State<PackaceLearnView> with TickerProviderStateMixin, LaunchMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),

      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).buttonTheme.colorScheme?.onSecondary,
        onPressed: () {
          launchURL("x");
        },
      ),
      body: Column(
        children: [
          Text('a', style: Theme.of(context).textTheme.bodyLarge),
          LoadingBar(),
        ],
      ),
    );
  }
}
