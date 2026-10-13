import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_application_1/202/service/comment_model.dart';
import 'package:flutter_application_1/202/service/post_model.dart';

abstract class IPostService {
  Future<bool> addItemToService(PostModel postModel);
  Future<bool> putItemToService(PostModel postModel, int id);
  Future<List<PostModel>?> fetchPostItemsAdvance();
  Future<bool> deleteItemToService(int id);
  Future<List<CommentModel>?> fetchRelatedCommentWithPostId(int postId);
}

class PostService implements IPostService {
  late final Dio _dio;
  PostService() : _dio = Dio(BaseOptions(baseUrl: 'https://jsonplaceholder.typicode.com/'));

  @override
  Future<bool> addItemToService(PostModel postModel) async {
    try {
      final response = await _dio.post(_postServicePaths.posts.name, data: postModel);
      return response.statusCode == HttpStatus.created;
    } on DioException catch (error) {
      _ShowDebug.showDioError(error, this);
    }
    return false;
  }

  @override
  Future<bool> putItemToService(PostModel postModel, int id) async {
    try {
      final response = await _dio.put('${_postServicePaths.posts.name}/$id', data: postModel);
      return response.statusCode == HttpStatus.ok;
    } on DioException catch (error) {
      _ShowDebug.showDioError(error, this);
    }
    return false;
  }

  @override
  Future<bool> deleteItemToService(int id) async {
    try {
      final response = await _dio.delete('${_postServicePaths.posts.name}/$id');
      return response.statusCode == HttpStatus.ok;
    } on DioException catch (error) {
      _ShowDebug.showDioError(error, this);
    }
    return false;
  }

  @override
  Future<List<PostModel>?> fetchPostItemsAdvance() async {
    try {
      final response = await _dio.get(_postServicePaths.posts.name);

      if (response.statusCode == HttpStatus.ok) {
        final datas = response.data;

        if (datas is List) {
          {
            return datas.map((e) => PostModel.fromJson(e)).toList();
          }
        }
        return null;
      }
    } on DioException catch (error) {
      _ShowDebug.showDioError(error, this);
    }
    return null;
  }

  @override
  Future<List<CommentModel>?> fetchRelatedCommentWithPostId(int postId) async {
    try {
      final response = await _dio.get(
        _postServicePaths.comments.name,
        queryParameters: {_postQueryPaths.postId.name: postId},
      );

      if (response.statusCode == HttpStatus.ok) {
        final datas = response.data;

        if (datas is List) {
            return datas.map((e) => CommentModel.fromJson(e)).toList();
        }
        return null;
      }
    } on DioException catch (error) {
      _ShowDebug.showDioError(error, this);
    }
    return null;
  }
}

// ignore: unused_field
enum _postServicePaths { posts, comments }

enum _postQueryPaths { postId }

class _ShowDebug {
  static void showDioError<T>(DioException error, T type) {
    if (kDebugMode) {
      print(error.message);
      print(type);
    }
  }
}
