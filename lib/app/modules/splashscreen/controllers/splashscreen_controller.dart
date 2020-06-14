import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

class SplashScreenController extends RxController {
  Box box;
  Dio dio;

  dynamic init() async {
    var dir = await getApplicationDocumentsDirectory();
    Hive.init(dir.path);
    box = await Hive.openBox('preferences');

    //set API configs
    BaseOptions options = BaseOptions(
        baseUrl: 'https://nutricaoapp.herokuapp.com',
        contentType: 'application/json');

    //init Dio
    dio = Dio(options);

    setPage(box.get('isLogged') == null ? false : box.get('isLogged'));
  }

  void setLogout() {
    box.clear();
    Get.offAndToNamed('/');
  }

  dynamic getPreference(String key) => box.get(key);
  void setPreference(String key, dynamic value) => box.put(key, value);

  void setPage(bool isLogged) {
    Future.delayed(Duration(milliseconds: 500));
    isLogged ? Get.offAndToNamed('/home') : Get.offAndToNamed('/login');
  }

  //loading animation
  void isLoading({bool loading, bool hasFinished}) {
    if (loading != null && loading) {
      Get.dialog(
        Center(
          child: CircularProgressIndicator(
            valueColor:
                new AlwaysStoppedAnimation<Color>(Get.theme.primaryColor),
          ),
        ),
        barrierDismissible: true,
      );
    } else if (hasFinished != null && hasFinished) {
      Get.back();
    } else {
      return null;
    }
  }
}
