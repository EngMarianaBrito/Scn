import 'package:get/get.dart';
import 'package:nutricao/app/modules/nutrcionist/models/nutricionist_rating_model.dart';
import 'package:nutricao/app/modules/nutrcionist/repositories/nutricionist_rating_repository.dart';

class NutricionistProfileController extends GetController {
  NutricionistRatings data;

  Future<void> fetchNutricionist() async {
    NutricionistDataRating api = NutricionistDataRating();

    var response = await api.fetchData();

    if (response == null) {
      Get.snackbar("Erro", "Não foi possível obter os dados");
    } else {
      data = response;
      update();
    }
  }
}
