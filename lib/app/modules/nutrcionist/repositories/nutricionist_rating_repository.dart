
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:nutricao/app/modules/nutrcionist/models/nutricionist_rating_model.dart';
import 'package:nutricao/app/modules/splashscreen/controllers/splashscreen_controller.dart';

class NutricionistDataRating {
  Future<NutricionistRatings> fetchData() async {
    try {
      String token = Get.find<SplashScreenController>().box.get('token');

      var response = await Get.find<SplashScreenController>().dio.get("/rating",
          queryParameters: {'nutricionist_id': '1'},
          options: Options(headers: {'Authorization': 'Bearer $token'}));

      final Map<String, dynamic> data = {"data": response.data};

      return NutricionistRatings.fromJson(data);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
