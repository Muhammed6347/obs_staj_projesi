import 'package:flutter/material.dart';

class ImageLearn extends StatelessWidget {
  const ImageLearn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          SizedBox(height: 400, width: 300, child: PngImage(name: ImageItems().appleBookWithoutPath)),
          Image.network(
            "https://www.pngwing.com/tr/free-png-zabqc",
            errorBuilder: (context, error, stackTrace) => const Icon(Icons.abc_outlined),
          ),
        ],
      ),
    );
  }
}

class ImageItems {
  final String apple = "assets/pngtree-3d-red-apple-png-with-green-leaf-png-image_10201408.png";
  final String appleBook = "assets/png/images_2";
  final String appleBookWithoutPath = "images_2";
}

class PngImage extends StatelessWidget {
  const PngImage({super.key, required this.name});
  final String name;

  @override
  Widget build(BuildContext context) {
    return Image.asset(_nameWithPath, fit: BoxFit.cover);
  }

  String get _nameWithPath => 'assets/png/$name.png';
}
