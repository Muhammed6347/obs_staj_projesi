import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureContextLearn extends StatefulWidget {
  const SecureContextLearn({super.key});

  @override
  State<SecureContextLearn> createState() => _SecureContextLearnState();
}

enum _SecureKeys { token }

class _SecureContextLearnState extends State<SecureContextLearn> {
  final _storage = const FlutterSecureStorage();
  String _title = '';
  void saveItems(String data) {
    setState(() {
      _title = data;
    });
  }

  @override
  void initState() {
    super.initState();
    getSecurItems();
  }

  Future<void> getSecurItems() async {
    _title = (await _storage.read(key: _SecureKeys.token.name)) ?? '';
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          await _storage.write(key: _SecureKeys.token.name, value: _title);
        },
        label: Text('save'),
      ),
      body: TextField(onChanged: saveItems),
    );
  }
}
