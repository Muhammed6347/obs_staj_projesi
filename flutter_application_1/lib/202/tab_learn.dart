import 'package:flutter/material.dart';
import 'package:flutter_application_1/101/icon_learn.dart';
import 'package:flutter_application_1/101/image_learn.dart';

class TabLearn extends StatefulWidget {
  const TabLearn({super.key});

  @override
  State<TabLearn> createState() => _TabLearnState();
}

class _TabLearnState extends State<TabLearn> with TickerProviderStateMixin {
  late final TabController _tabController;
  final double _notchedValue = 10;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _MyTabViews.values.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _MyTabViews.values.length,
      child: Scaffold(
        extendBody: true,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            _tabController.animateTo(_MyTabViews.home.index);
          },
        ),
        bottomNavigationBar: BottomAppBar(
          notchMargin: _notchedValue,
          child: _myTabView(tabController: _tabController),
        ),
        appBar: AppBar(),
        body: _tabbarView(tabController: _tabController),
      ),
    );
  }
}

// ignore: camel_case_types
class _myTabView extends StatelessWidget {
  const _myTabView({required this._tabController});

  final TabController _tabController;

  @override
  Widget build(BuildContext context) {
    return TabBar(
      padding: EdgeInsets.zero,
      onTap: (int index) {},
      controller: _tabController,
      tabs: _MyTabViews.values.map((e) => Tab(text: e.name)).toList(),
    );
  }
}

// ignore: camel_case_types
class _tabbarView extends StatelessWidget {
  const _tabbarView({required this._tabController});

  final TabController _tabController;

  @override
  Widget build(BuildContext context) {
    return TabBarView(
      physics: NeverScrollableScrollPhysics(),
      controller: _tabController,
      children: [ImageLearn(), IconLearnView(), ImageLearn(), IconLearnView()],
    );
  }
}

enum _MyTabViews { home, settings, favorite, profile }

extension _MyTabViewsExtension on _MyTabViews {}
