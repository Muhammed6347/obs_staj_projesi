import 'package:dio/dio.dart';

mixin ProjectDioMixin {
  final Dio service = Dio(BaseOptions(
    baseUrl: 'https://reqres.in/api',
    headers: {
      'x-api-key': 'reqres_bd659c5e78bd4a0baff92681129f1f6a',
    },
  ));
}