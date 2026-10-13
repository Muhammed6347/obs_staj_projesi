import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/202/service/comment_learn_view.dart';
import 'package:flutter_application_1/202/service/post_model.dart';
import 'package:flutter_application_1/202/service/post_service.dart';

class ServiceLearnView extends StatefulWidget {
  const ServiceLearnView({super.key});

  @override
  State<ServiceLearnView> createState() => _ServiceLearnViewState();
}

class _ServiceLearnViewState extends State<ServiceLearnView> {
  List<PostModel>? _items;
  String? name;
  bool _isloading = false;
  // ignore: unused_field
  late final Dio _dio;
  final _baseUrl = 'https://jsonplaceholder.typicode.com/';
  //Test Edilebilir kod başladı
  late final IPostService _postService;
  @override
  void initState() {
    super.initState();
    _dio = Dio(BaseOptions(baseUrl: _baseUrl));
    _postService = PostService();
    name = 'veli';
    fetchPostItemsAdvance();
  }

  void _changeLoading() {
    setState(() {
      _isloading = !_isloading;
    });
  }

  Future<void> fetchPostItems() async {
    _changeLoading();
    final response = await Dio().get('https://jsonplaceholder.typicode.com/posts/');

    if (response.statusCode == HttpStatus.ok) {
      final datas = response.data;

      if (datas is List) {
        setState(() {
          _items = datas.map((e) => PostModel.fromJson(e)).toList();
        });
      }
    }
    _changeLoading();
  }

  Future<void> fetchPostItemsAdvance() async {
    _changeLoading();
    _items = await _postService.fetchPostItemsAdvance();
    _changeLoading();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name ?? ''),
        actions: [_isloading ? const CircularProgressIndicator.adaptive() : const SizedBox.shrink()],
      ),

      body: ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 10),
        itemCount: _items?.length,
        itemBuilder: (context, index) {
          return _PostCard(model: _items?[index]);
        },
      ),
    );
  }
}

class _PostCard extends StatelessWidget {
  // ignore: unused_element_parameter
  const _PostCard({super.key, required this.model});

  final PostModel? model;
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(bottom: 20),
      child: ListTile(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => CommentLearnView(postId: model?.id)));
        },
        title: Text(model?.title ?? ''),
        subtitle: Text(model?.body ?? ''),
      ),
    );
  }
}
