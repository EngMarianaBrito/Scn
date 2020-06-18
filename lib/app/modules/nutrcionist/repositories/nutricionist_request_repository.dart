import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:nutricao/app/modules/nutrcionist/models/nutricionist_request_model.dart';
import 'package:nutricao/app/modules/splashscreen/controllers/splashscreen_controller.dart';

class NutricionistDataRequests {
  Future<bool> newRequest(dynamic nutricionistId, String weight, String height,
      String reason) async {
    try {
      String token = Get.find<SplashScreenController>().box.get('token');

      await Get.find<SplashScreenController>().dio.post(
            "/appointment",
            data: {
              "weight": weight,
              "hieght": height,
              "reason": reason,
              "nutricionist_id": nutricionistId
            },
            options: Options(
              headers: {
                'Authorization': 'Bearer $token',
              },
            ),
          );

      return true;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future<NutricionistRequests> myAppointments() async {
    try {
      String token = Get.find<SplashScreenController>().box.get('token');

      var response = await Get.find<SplashScreenController>().dio.get(
            "/appointment",
            options: Options(
              headers: {
                'Authorization': 'Bearer $token',
              },
            ),
          );

      var data = {"data": response.data};

      return NutricionistRequests.fromJson(data);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
