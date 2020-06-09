import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nutricao/app/modules/login/pages/login_page.dart';
import 'package:nutricao/app/modules/register/pages/register_page.dart';
import 'package:nutricao/app/shared/theme.dart';

void main() {
  runApp(GetMaterialApp(
    initialRoute: '/login',
    namedRoutes: {
      '/login': GetRoute(page: LoginPage()),
      '/register': GetRoute(page: RegisterPage()),
    },
    theme: appTheme('patient'),
  ));
}