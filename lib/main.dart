import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nutricao/app/modules/home/page/home_page.dart';
import 'package:nutricao/app/modules/login/pages/login_page.dart';
import 'package:nutricao/app/modules/register/pages/register_page.dart';
import 'package:nutricao/app/modules/splashscreen/page/splashscreen_page.dart';
import 'package:nutricao/app/shared/theme.dart';

void main() {
  runApp(GetMaterialApp(
    initialRoute: '/',
    defaultTransition: Transition.cupertino,
    namedRoutes: {
      '/': GetRoute(page: SplashScreen()),
      '/home': GetRoute(page: HomePage()),
      '/login': GetRoute(page: LoginPage()),
      '/register': GetRoute(page: RegisterPage()),
    },
    theme: appTheme('patient'),
  ));
}