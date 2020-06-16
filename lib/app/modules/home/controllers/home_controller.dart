import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nutricao/app/modules/appointment/pages/pacient_page.dart';
import 'package:nutricao/app/modules/nutrcionist/pages/nutricionist_requests_appointment.dart';
import 'package:nutricao/app/modules/nutrcionist/pages/nutricionists_list_page.dart';
import 'package:nutricao/app/modules/splashscreen/controllers/splashscreen_controller.dart';

class HomeController extends RxController {
  static SplashScreenController get to => Get.find();

  final List<StatelessWidget> tabsPacient = [
    NutricionistListPage(),
    PacientAppointmentPage(),
    Container(),
  ];

  final List<StatelessWidget> tabsNutricionist = [
    NutricionistListPage(),
    NutricionistRequestsAppointmentPage(),
    Container(),
  ];

  final currentIndex = 0.obs;

  void changeIndex(int index) {
    currentIndex.value = index;
  }
}
