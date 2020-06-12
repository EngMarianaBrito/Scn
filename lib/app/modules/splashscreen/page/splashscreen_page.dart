import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nutricao/app/modules/splashscreen/controllers/splashscreen_controller.dart';

class SplashScreen extends StatelessWidget {
  final SplashScreenController splashController =
      Get.put(SplashScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GetX<SplashScreenController>(
          initState: (_) {
            splashController.init();
          },
          builder: (_) => Image.asset("assets/images/logo.png",
              width: 120.0, height: 120.0),
        ),
      ),
    );
  }
}
