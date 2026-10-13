import 'package:flutter/material.dart';
import 'package:flutter_application_1/product/constant/duration_items.dart';
import 'package:flutter_application_1/product/constant/lottie_items.dart';
import 'package:flutter_application_1/product/global/theme_notifer.dart';
import 'package:flutter_application_1/product/navigator/navigator_routes.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class LottieLearn extends StatefulWidget {
  const LottieLearn({super.key});

  @override
  State<LottieLearn> createState() => _LottieLearnState();
}

class _LottieLearnState extends State<LottieLearn> with TickerProviderStateMixin {
  late AnimationController controller;
  bool isLight = false;
  @override
  void initState() {
    super.initState();
    controller = AnimationController(vsync: this, duration: DurationItems.durationNormal());
    navigateToHome();
  }

  Future<void> navigateToHome() async {
    await Future.delayed(Duration(seconds: 1));
    Navigator.of(context).pushReplacementNamed(NavigateRoutes.home.withParaf);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          InkWell(
            onTap: () async {
              await controller.animateTo(isLight ? 0.5 : 1);
              isLight = !isLight;
              Future.microtask(() {
                context.read<ThemeNotifer>().changeTheme();
              });
            },
            child: Lottie.asset(LottieItems.themeChange.lottiePath, repeat: false, controller: controller),
          ),
        ],
      ),
      body: LoadingLottie(),
    );
  }
}

class LoadingLottie extends StatelessWidget {
  LoadingLottie({super.key});
  final _loadingLottie = 'https://lottie.host/e7c64d52-8ec7-4123-ba2f-6c2a463c15b7/fczwfNTq3L.lottie';

  @override
  Widget build(BuildContext context) {
    return Center(child: LottieBuilder.network(_loadingLottie));
  }
}
