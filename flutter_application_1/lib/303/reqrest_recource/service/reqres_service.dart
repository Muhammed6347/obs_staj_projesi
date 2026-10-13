import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_application_1/303/reqrest_recource/model/resource_model.dart';

abstract class IReqresService {
  IReqresService(this.dio);
  final Dio dio;
  Future<ResourceModel?> fetchResourceItem();
}

enum _ReqRestPath { products }

class ReqresService extends IReqresService {
  ReqresService(super.dio);

  @override
  Future<ResourceModel?> fetchResourceItem() async {
    final response = await dio.get('/${_ReqRestPath.products.name}');
    if (response.statusCode == HttpStatus.ok) {
      final jsonBody = response.data;
      if (jsonBody is Map<String, dynamic>) {
        return ResourceModel.fromJson(jsonBody);
      }
    }
    return null;
  }
}
