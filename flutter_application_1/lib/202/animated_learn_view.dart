import 'package:flutter/material.dart';

const double kZero = 0;

class AnimatedLearnView extends StatefulWidget {
  const AnimatedLearnView({super.key});

  @override
  State<AnimatedLearnView> createState() => _AnimatedLearnViewState();
}

class _AnimatedLearnViewState extends State<AnimatedLearnView> with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    controller = AnimationController(vsync: this, duration: _DurationItems().durationLow);
  }
  //Text('data', style: context.textTheme().bodyLarge),

  late AnimationController controller;

  bool _isVisible = false;
  bool _isOpacity = false;

  void _changeVisible() {
    setState(() {
      _isVisible = !_isVisible;
    });
  }

  void _changeOpacity() {
    setState(() {
      _isOpacity = !_isOpacity;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: _placeHolderWidget()),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _changeVisible();
          controller.animateTo(_isVisible ? 1 : kZero);
        },
      ),
      body: Column(
        children: [
          ListTile(
            title: AnimatedOpacity(
              duration: _DurationItems().durationLow,
              opacity: _isOpacity ? 1 : kZero,
              child: Text('data'),
            ),
            trailing: IconButton(
              onPressed: () {
                _changeOpacity();
              },
              icon: Icon(Icons.accessibility_new_outlined),
            ),
          ),
          AnimatedDefaultTextStyle(
            style: (_isVisible ? context.textTheme().bodyMedium : context.textTheme().headlineLarge) ?? TextStyle(),
            duration: _DurationItems().durationLow,
            child: Text('a'),
          ),
          AnimatedIcon(icon: AnimatedIcons.view_list, progress: controller),
          AnimatedContainer(
            duration: _DurationItems().durationLow,
            height: MediaQuery.of(context).size.width * 0.2,
            width: _isVisible ? MediaQuery.of(context).size.height * 0.2 : kZero,
            color: Colors.red,
            margin: EdgeInsets.all(10),
          ),
          Expanded(
            child: Stack(
              children: [
                AnimatedPositioned(
                  top: 10,
                  curve: Curves.elasticOut,
                  duration: _DurationItems().durationLow,
                  child: Text('data'),
                ),
              ],
            ),
          ),
          Expanded(
            child: AnimatedList(
              itemBuilder: (context, index, animation) {
                return Text('data');
              },
            ),
          ),
        ],
      ),
    );
  }

  AnimatedCrossFade _placeHolderWidget() {
    return AnimatedCrossFade(
      firstChild: const Placeholder(),
      secondChild: const SizedBox.shrink(),
      crossFadeState: _isVisible ? CrossFadeState.showFirst : CrossFadeState.showSecond,
      duration: _DurationItems().durationLow,
    );
  }
}

extension BuildContextExtension on BuildContext {
  TextTheme textTheme() {
    return Theme.of(this).textTheme;
  }
}

class _DurationItems {
  final durationLow = Duration(seconds: 1);
}
