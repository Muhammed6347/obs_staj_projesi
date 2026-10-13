import 'package:flutter/material.dart';

class FormLearnView extends StatefulWidget {
  const FormLearnView({super.key});

  @override
  State<FormLearnView> createState() => _FormLearnViewState();
}

class _FormLearnViewState extends State<FormLearnView> {
  GlobalKey<FormState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Form(
        key: _key,
        autovalidateMode: AutovalidateMode.always,
        onChanged: () {
          print('a');
        },
        child: Column(
          children: [
            TextFormField(validator: FormFieldValidator().isNotEmpty),
            TextFormField(validator: FormFieldValidator().isNotEmpty),
            DropdownButtonFormField<String>(
              validator: FormFieldValidator().isNotEmpty,
              items: const [
                DropdownMenuItem(value: 'V', child: Text('a')),
                DropdownMenuItem(value: 'V1', child: Text('b')),
                DropdownMenuItem(value: 'V2', child: Text('c')),
              ],
              onChanged: (value) {},
            ),
            CheckboxListTile(value: true, onChanged: (value) {}),
            ElevatedButton(
              onPressed: () {
                if (_key.currentState?.validate() ?? false) {
                  print('okey');
                }
              },
              child: Text('save'),
            ),
          ],
        ),
      ),
    );
  }
}

class FormFieldValidator {
  String? isNotEmpty(String? data) {
    return (data?.isNotEmpty ?? false) ? null : ValidatorMessage()._notEmpty;
  }
}

class ValidatorMessage {
  final String _notEmpty = 'Boş Geçilemez';
}
