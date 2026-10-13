import 'package:flutter/material.dart';
import 'package:flutter_application_1/product/global/resource_context.dart';
import 'package:provider/provider.dart';

class ImageLearn202 extends StatefulWidget {
  const ImageLearn202({super.key});

  @override
  State<ImageLearn202> createState() => _ImageLearn202State();
}

class _ImageLearn202State extends State<ImageLearn202> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              context.read<ResourceContext>().clear();
            },
            icon: Icon(Icons.remove),
          ),
        ],
        title: Text(context.read<ResourceContext>().model?.data?.length.toString() ?? ''),
      ),
      body: ImagePaths.images_2.toWidget(),
    );
  }
}

enum ImagePaths { images_2 }

extension ImagePathsExtension on ImagePaths {
  String path() {
    return 'assets/png/$name.png';
  }

  Widget toWidget() {
    return Image.asset(path());
  }
}
