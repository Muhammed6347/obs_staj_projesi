import 'package:flutter_application_1/303/reqrest_recource/model/resource_model.dart';

class ResourceContext {
  ResourceModel? model;
  void saveModel(ResourceModel? model) {
    this.model = model;
  }

  void clear() {
    model = null;
  }
}
