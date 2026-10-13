import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/202/service/post_model.dart';

class ServicePostLearnView extends StatefulWidget {
  const ServicePostLearnView({super.key});

  @override
  State<ServicePostLearnView> createState() => _ServicePostLearnViewState();
}

class _ServicePostLearnViewState extends State<ServicePostLearnView> {
  String? name;
  bool _isloading = false;
  late final Dio _dio;
  final _baseUrl = 'https://jsonplaceholder.typicode.com';
  final TextEditingController _titleContoller = TextEditingController();
  final TextEditingController _bodyContoller = TextEditingController();
  final TextEditingController _userIdContoller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _dio = Dio(BaseOptions(baseUrl: _baseUrl));
  }

  void _changeLoading() {
    setState(() {
      _isloading = !_isloading;
    });
  }

  Future<void> _addItemToService(PostModel postModel) async {
    _changeLoading();
    final response = await _dio.post('posts', data: postModel.toJson());
    if (response.statusCode == HttpStatus.created) {
      name = 'Başarili';
    }
    _changeLoading();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name ?? ''),
        actions: [_isloading ? const CircularProgressIndicator.adaptive() : const SizedBox.shrink()],
      ),

      body: Column(
        children: [
          TextField(
            controller: _titleContoller,
            decoration: InputDecoration(labelText: 'title'),
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.next,
          ),
          TextField(
            controller: _bodyContoller,
            decoration: InputDecoration(labelText: 'body'),
            textInputAction: TextInputAction.next,
          ),
          TextField(
            controller: _userIdContoller,
            keyboardType: TextInputType.number,
            inputFormatters: [],
            decoration: InputDecoration(labelText: 'UserId'),
          ),
          TextButton(
            onPressed: _isloading
                ? null
                : () {
                    if (_titleContoller.text.isNotEmpty &&
                        _bodyContoller.text.isNotEmpty &&
                        _userIdContoller.text.isNotEmpty) {
                      final model = PostModel(
                        body: _bodyContoller.text,
                        title: _titleContoller.text,
                        userId: int.tryParse(_userIdContoller.text),
                      );
                      _addItemToService(model);
                    }
                  },
            child: Text('Send'),
          ),
        ],
      ),
    );
  }
}

// ignore: unused_element
class _PostCard extends StatelessWidget {
  // ignore: unused_element_parameter
  const _PostCard({super.key, required this.model});

  final PostModel? model;
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(bottom: 20),
      child: ListTile(title: Text(model?.title ?? ''), subtitle: Text(model?.body ?? '')),
    );
  }
}
