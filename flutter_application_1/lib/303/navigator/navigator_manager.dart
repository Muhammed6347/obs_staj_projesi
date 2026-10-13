import 'package:flutter/material.dart';
import 'package:flutter_application_1/product/navigator/navigator_routes.dart';


class NavigatorManager {
  NavigatorManager._();

  // instance DEĞİL, doğrudan static değişken tanımlıyoruz:
  static final GlobalKey<NavigatorState> navigatorGlobalKey = GlobalKey<NavigatorState>();

  // Metodu da static yapıyoruz:
  static void pushToPage(NavigateRoutes route, {Object? arguments}) {
    navigatorGlobalKey.currentState?.pushNamed(
      route.withParaf,
      arguments: arguments,
    );
  }
}