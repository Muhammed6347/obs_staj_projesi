import 'package:flutter/material.dart';
// ignore: implementation_imports
import 'package:flutter/src/services/system_chrome.dart';
import 'package:flutter_application_1/101/image_learn.dart';

class NoteDemos extends StatelessWidget {
  const NoteDemos({super.key});
  final _title = 'Create your fist note';
  final _description = 'Add a note ';
  final _importNote = 'Import Notes ';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[50],

      appBar: AppBar(systemOverlayStyle: SytstemUiOverlayStyle.dark),
      body: Padding(
        padding: PaddingItems.horizontalPadding,
        child: Column(
          children: [
            PngImage(name: ImageItems().appleBookWithoutPath),
            _TitleWidget(title: _title),
            Padding(
              padding: PaddingItems.verticalPadding,
              child: _SubTitleWidget.name(title: _description * 7),
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 50),
              ),
              child: const Text('Create a note'),
            ),
            TextButton(onPressed: () {}, child: Text(_importNote)),
            SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}

class SytstemUiOverlayStyle {
  static SystemUiOverlayStyle? get dark => null;
}

//Center text widget
class _SubTitleWidget extends StatelessWidget {
  const _SubTitleWidget.name({required this.title})
    : textAlign = TextAlign.center;

  final String title;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textAlign: textAlign,
      style: Theme.of(context).textTheme.headlineSmall?.copyWith(
        color: Colors.black,
        fontWeight: FontWeight.w400,
      ),
    );
  }
}

class _TitleWidget extends StatelessWidget {
  const _TitleWidget({required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: Theme.of(context).textTheme.headlineMedium?.copyWith(
        color: Colors.black,
        fontWeight: FontWeight.w700,
      ),
    );
  }
}

class PaddingItems {
  static final EdgeInsets horizontalPadding = const EdgeInsets.symmetric(
    horizontal: 20,
  );
  static final EdgeInsets verticalPadding = const EdgeInsets.symmetric(
    vertical: 20,
  );
}
