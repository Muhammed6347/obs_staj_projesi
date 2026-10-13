import 'package:flutter/material.dart';

class MobxImageUpload extends StatefulWidget {
  const MobxImageUpload({super.key});

  @override
  State<MobxImageUpload> createState() => _MobxImageUploadState();
}

class _MobxImageUploadState extends State<MobxImageUpload> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Image Upload')),

      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: Card(
              elevation: 10,
              child: IconButton(onPressed: () {}, icon: Icon(Icons.upload_file)),
            ),
          ),
          Divider(),
          Spacer(flex: 4),
        ],
      ),
    );
  }
}
