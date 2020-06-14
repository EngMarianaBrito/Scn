import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:nutricao/app/modules/nutrcionist/models/nutricionist_list_model.dart';
import 'package:nutricao/app/modules/splashscreen/controllers/splashscreen_controller.dart';

class NutricionistData {
  Future<Nutricionist> fetchData() async {
    try {
      String token = Get.find<SplashScreenController>().box.get('token');

      var response = await Get.find<SplashScreenController>().dio.get(
          "/nutricionist",
          options: Options(headers: {'Authorization': 'Bearer $token'}));

      final data = {"data": response.data};
      return Nutricionist.fromJson(data);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
