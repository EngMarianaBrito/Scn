import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:nutricao/app/modules/nutrcionist/models/nutricionist_rating_model.dart';
import 'package:nutricao/app/modules/splashscreen/controllers/splashscreen_controller.dart';

class NutricionistDataRating {
  Future<NutricionistRatings> fetchData(int nutricionistId) async {
    try {
      String token = Get.find<SplashScreenController>().box.get('token');

      var response = await Get.find<SplashScreenController>().dio.get("/rating",
          queryParameters: {'nutricionist_id': nutricionistId},
          options: Options(headers: {'Authorization': 'Bearer $token'}));

      final Map<String, dynamic> data = {"data": response.data};

      return NutricionistRatings.fromJson(data);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future<bool> sendRating(
      String comment, double rating, int nutricionistId) async {
    try {
      String token = Get.find<SplashScreenController>().box.get('token');

      await Get.find<SplashScreenController>().dio.post(
            "/rating",
            data: {
              "comment": comment,
              "rating": rating,
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
}
