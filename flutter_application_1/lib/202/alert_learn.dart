import 'package:flutter/material.dart';

class AlertLearn extends StatefulWidget {
  const AlertLearn({super.key});

  @override
  State<AlertLearn> createState() => _AlertLearnState();
}

class _AlertLearnState extends State<AlertLearn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final response = await showDialog(
            context: context,
            builder: (context) {
              return _ImageZoomDialog();
            },
          );
          debugPrint(response.toString());
        },
      ),
      appBar: AppBar(),
    );
  }
}

// ignore: unused_element
class _UpdateDialog extends StatelessWidget {
  const _UpdateDialog();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Version update?'),
      actions: [
        ElevatedButton(onPressed: () {}, child: Text('update')),
        TextButton(
          onPressed: () {
            Navigator.pop(context, true);
          },
          child: Text('CLose'),
        ),
      ],
    );
  }
}

class Keys {
  static const versionUpdate = 'version Update';
}

class UpdateDialog extends AlertDialog {
  UpdateDialog({super.key, required BuildContext context})
    : super(
        title: Text(Keys.versionUpdate),
        actions: [
          ElevatedButton(onPressed: () {}, child: Text('update')),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('CLose'),
          ),
        ],
      );
}

class _ImageZoomDialog extends StatelessWidget {
  const _ImageZoomDialog();
           
  final String _url =  'https://picsum.photos/200';
  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.zero,
      child: SizedBox(
        height: 400,
        child: InteractiveViewer(
          child: Image.network(_url,
            fit: BoxFit.cover,
            height: MediaQuery.of(context).size.height * 0.6,
          ),
        ),
      ),
    );
  }
}
