import 'package:flutter/foundation.dart';
import 'package:flutter_application_1/303/reqrest_recource/model/resource_model.dart';
import 'package:flutter_application_1/303/reqrest_recource/service/reqres_service.dart';
import 'package:flutter_application_1/product/global/resource_context.dart';

class ReqResProvider extends ChangeNotifier {
  final IReqresService reqresService;
  List<Data> resources = [];
  bool isLoading = false;

  void _changeLoading() {
    isLoading = !isLoading;
    notifyListeners();
  }

  ReqResProvider(this.reqresService) {
    _fetch();
  }

  Future<void> _fetch() async {
    _changeLoading();
    resources = (await reqresService.fetchResourceItem())?.data ?? [];
    _changeLoading();
  }

  void saveToLocale(ResourceContext resourceContext) {
    resourceContext.saveModel(ResourceModel(data: resources));
  }
}
