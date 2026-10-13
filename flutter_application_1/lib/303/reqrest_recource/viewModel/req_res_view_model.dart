import 'package:flutter_application_1/202/cache/shared_learn_cache.dart';
import 'package:flutter_application_1/303/reqrest_recource/model/resource_model.dart';
import 'package:flutter_application_1/303/reqrest_recource/service/reqres_service.dart';
import 'package:flutter_application_1/303/reqrest_recource/view/req_res_view.dart';
import 'package:flutter_application_1/product/service/project_dio.dart';
import 'package:flutter_application_1/product/service/project_network_manager.dart';

abstract class ReqResViewModel extends LoadingStateFull<ReqResView> with ProjectDioMixin {
  late final IReqresService reqresService;
  List<Data> resources = [];
  @override
  void initState() {
    super.initState();
    reqresService = ReqresService(ProjectNetworkManager.instance.service);
    ProjectNetworkManager.instance.addBaseHeaderToToken('veli');
    _fetch();
  }

  Future<void> _fetch() async {
    changeLoading();
    resources = (await reqresService.fetchResourceItem())?.data ?? [];
    changeLoading();
  }
}
