import 'package:flutter/material.dart';
import 'package:flutter_application_1/101/list_view_learn.dart';

class SheetLearn extends StatefulWidget {
  const SheetLearn({super.key});

  @override
  State<SheetLearn> createState() => _SheetLearnState();
}

class _SheetLearnState extends State<SheetLearn> with ProductSheetMixin {
  Color _backgroundColor = Colors.white;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: _backgroundColor,
      body: Center(
        child: TextButton(
          onPressed: () {
            showCustomSheet(context, ListViewLearn());
          },
          child: Text('show'),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final result = await showModalBottomSheet(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
            isScrollControlled: true,
            context: context,
            builder: (context) {
              return _CustomSheet(backgroundColor: _backgroundColor);
            },
          );
          debugPrint(result.toString());
          if (result is bool) {
            setState(() {
              _backgroundColor = Colors.cyan;
            });
          }
        },
        child: Icon(Icons.share),
      ),
    );
  }
}

class _CustomSheet extends StatefulWidget {
  const _CustomSheet({required Color backgroundColor});

  @override
  State<_CustomSheet> createState() => _CustomSheetState();
}

class _CustomSheetState extends State<_CustomSheet> {
  final _gripHeight = 30.0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: _gripHeight,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Divider(
            color: Theme.of(context).colorScheme.onSurface,
            thickness: 5,
            indent: MediaQuery.of(context).size.width * 0.45,
            endIndent: MediaQuery.of(context).size.width * 0.45,
          ),
          Positioned(
            right: MediaQuery.of(context).size.width * 0.01,
            top: 0,
            child: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Padding(padding: const EdgeInsets.all(8.0), child: Icon(Icons.close)),
            ),
          ),
        ],
      ),
    );
  }
}

mixin ProductSheetMixin {
  Future<T?> showCustomSheet<T>(BuildContext context, Widget child) async {
    return showModalBottomSheet<T>(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
      context: context,
      builder: (context) {
        return _CustomMainSheet(child: child);
      },
    );
  }
}

class _CustomMainSheet extends StatelessWidget {
  const _CustomMainSheet({required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _BaseSheetHeader(),
          Expanded(child: child),
        ],
      ),
    );
  }
}

class _BaseSheetHeader extends StatelessWidget {
  const _BaseSheetHeader() : _gripHeight = 30;

  final double _gripHeight;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: _gripHeight,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Divider(
            color: Colors.black,
            thickness: 5,
            indent: MediaQuery.of(context).size.width * 0.45,
            endIndent: MediaQuery.of(context).size.width * 0.45,
          ),
          Positioned(
            right: 10,
            top: 0,
            child: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Padding(padding: PaddingManager.paddingLowAll, child: Icon(Icons.close)),
            ),
          ),
        ],
      ),
    );
  }
}

class PaddingManager {
  static const paddingLowAll =  EdgeInsets.all(8.0);
}
