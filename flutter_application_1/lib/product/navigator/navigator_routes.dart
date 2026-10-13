import 'package:flutter_application_1/303/lottie_learn.dart';
import 'package:flutter_application_1/303/navigator/navigate_home_detail_view.dart';
import 'package:flutter_application_1/303/navigator/navigate_home_view.dart';

class NavigatorRoutes {
  static const paragf = "/";
  final items = {
    paragf: (context) => LottieLearn(),
    NavigateRoutes.home.withParaf: (context) => NavigateHomeView(),
    NavigateRoutes.detail.withParaf: (context) => NavigateHomeDetailView(),
  };

  String? get withParaf => null;

  static NavigatorRoutes? get detail => null;
}

enum NavigateRoutes { init, home, detail }

extension NavigateRoutesExtension on NavigateRoutes {
  String get withParaf => "/$name";
}
