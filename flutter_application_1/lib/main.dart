import 'package:flutter_application_1/101/navigation_learn.dart';
import 'package:flutter_application_1/303/feed_view.dart';
import 'package:flutter_application_1/303/lottie_learn.dart';
import 'package:flutter_application_1/303/mobx_image_picker/view/mobx_image_upload_view.dart';
import 'package:flutter_application_1/303/navigator/navigate_home_detail_view.dart';
import 'package:flutter_application_1/303/navigator/navigate_home_view.dart';
import 'package:flutter_application_1/product/constant/project_items.dart';
import 'package:flutter_application_1/product/global/resource_context.dart';
import 'package:flutter_application_1/product/global/theme_notifer.dart';
import 'package:flutter_application_1/product/navigator/navigator_custom.dart';
import 'package:flutter_application_1/product/navigator/navigator_routes.dart';
import 'package:provider/provider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';

void main() {
  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => MultiProvider(
        providers: [
          Provider<ResourceContext>(create: (_) => ResourceContext()),
          ChangeNotifierProvider<ThemeNotifer>(create: (_) => ThemeNotifer()),
        ],
        child: const MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget with NavigatorCustom {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      title: ProjectItems.projectName,
      debugShowCheckedModeBanner: false,
      theme: context.watch<ThemeNotifer>().currentTheme,

      //initialRoute:'/',
      onUnknownRoute: (settings) {
        return MaterialPageRoute(
          builder: (context) {
            return LottieLearn();
          },
        );
      },
      // routes: NavigatorRoutes().items,
      onGenerateRoute: onGenerateRoute,
      navigatorKey: NavigatorManager.navigatorGlobalKey,
      home: MobxImageUpload(),

      // home: LottieLearn(),
    );
  }
}
