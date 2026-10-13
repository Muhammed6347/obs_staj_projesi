import 'package:flutter/material.dart';

class NavigateHomeDetailView extends StatefulWidget {
  const NavigateHomeDetailView({super.key, this.id});
  final String? id;

  @override
  State<NavigateHomeDetailView> createState() => _NavigateHomeDetailViewState();
}

class _NavigateHomeDetailViewState extends State<NavigateHomeDetailView> {
  String? _id;

  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      final modelId = ModalRoute.of(context)?.settings.arguments;
      setState(() {
        _id = modelId is String ? modelId : widget.id;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.error,
      appBar: AppBar(title: Text(_id ?? '')));
  }
}
