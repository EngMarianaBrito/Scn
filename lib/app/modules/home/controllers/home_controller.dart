import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nutricao/app/modules/appointment/pages/patient_page.dart';
import 'package:nutricao/app/modules/nutrcionist/pages/nutricionist_list_patient.dart';
import 'package:nutricao/app/modules/nutrcionist/pages/nutricionist_requests_appointment.dart';
import 'package:nutricao/app/modules/nutrcionist/pages/nutricionists_list_page.dart';
import 'package:nutricao/app/modules/splashscreen/controllers/splashscreen_controller.dart';

class HomeController extends RxController {
  static SplashScreenController get to => Get.find();

  final List<StatelessWidget> tabsPatient = [
    NutricionistListPage(),
    PatientAppointmentPage(),
    Container(),
  ];

  final List<StatelessWidget> tabsNutricionist = [
    NutricionistListPage(),
    NutricionistRequestsAppointmentPage(),
    NutricionistListPatient(),
  ];

  final currentIndex = 0.obs;

  void changeIndex(int index) {
    currentIndex.value = index;
  }
}
