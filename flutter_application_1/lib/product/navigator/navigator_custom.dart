import 'package:flutter/material.dart';
import 'package:flutter_application_1/303/lottie_learn.dart';
import 'package:flutter_application_1/303/mobx_image_picker/view/mobx_image_upload_view.dart';
import 'package:flutter_application_1/303/navigator/navigate_home_detail_view.dart';
import 'package:flutter_application_1/303/navigator/navigate_home_view.dart';
import 'package:flutter_application_1/product/navigator/navigator_routes.dart';

mixin NavigatorCustom on Widget {
  Route<dynamic>? onGenerateRoute(RouteSettings routeSettings) {
    if (routeSettings.name?.isEmpty ?? true) {
      _navigateToNormal(LottieLearn());
    }

    if (routeSettings.name == NavigatorRoutes.paragf) return _navigateToNormal(MobxImageUpload());

    final _routes = routeSettings.name == NavigatorRoutes.paragf
        ? NavigateRoutes.init
        : NavigateRoutes.values.byName(routeSettings.name!.substring(1));

    switch (_routes) {
      case NavigateRoutes.init:
        return _navigateToNormal(LottieLearn());
      case NavigateRoutes.home:
        return _navigateToNormal(NavigateHomeView());
      case NavigateRoutes.detail:
        final _id = routeSettings.arguments;
        return _navigateToNormal(NavigateHomeDetailView(id: _id is String ? _id : null), isFullScreenDialog: true);
    }
  }

  Route<dynamic>? _navigateToNormal(Widget child, {bool? isFullScreenDialog}) {
    return MaterialPageRoute(
      fullscreenDialog: isFullScreenDialog ?? false,
      builder: (context) {
        return child;
      },
    );
  }
}
