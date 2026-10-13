import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/product/language/language_items.dart';

class TextFieldLearn extends StatefulWidget {
  const TextFieldLearn({super.key});

  @override
  State<TextFieldLearn> createState() => _TextFieldLearnState();
}

class _TextFieldLearnState extends State<TextFieldLearn> {
  final key = GlobalKey();

  FocusNode focusNodeTextFieldOne = FocusNode();
  FocusNode focusNodeTextFieldTwo = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Form(
        child: Column(
          children: [
            TextField(
              maxLength: 100,
              buildCounter: (context, {int? currentLength, bool? isFocused, int? maxLength}) {
                return AnimatedContainer(
                  key: key,
                  height: 10,
                  width: 10.0 * (currentLength ?? 0),
                  color: Colors.green,
                  duration: Duration(milliseconds: 100),
                );
              },
              keyboardType: TextInputType.emailAddress,
              autofocus: true,
              autofillHints: [AutofillHints.email],
              focusNode: focusNodeTextFieldOne,
              inputFormatters: [TextProjectInputFormater()._formatter],
              textInputAction: TextInputAction.next,
              decoration: _InputDecoration().emailInput,
            ),
            TextField(focusNode: focusNodeTextFieldTwo, minLines: 2, maxLines: 4),
          ],
        ),
      ),
    );
  }
}

class TextProjectInputFormater {
  final _formatter = TextInputFormatter.withFunction((oldValue, newValue) {
    if (newValue.text == 'a') {
      return oldValue;
    }
    return oldValue;
  });
}

class _InputDecoration {
  final emailInput = InputDecoration(
    prefixIcon: Icon(Icons.mail),
    border: OutlineInputBorder(),
    labelText: LanguageItems.mailTitle,
  );
}
