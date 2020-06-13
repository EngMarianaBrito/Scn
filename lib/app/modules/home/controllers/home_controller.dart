import 'package:get/get.dart';
import 'package:nutricao/app/modules/home/models/nutricionist_model.dart';
import 'package:nutricao/app/modules/home/repositories/nutricionist_repository.dart';

class HomeController extends GetController {
  static HomeController get to => Get.find();

  Nutricionist data;
  final hasError = false.obs;

  Future<void> fetchNutricionist() async {
    NutricionistData api = NutricionistData();

    var response = await api.fetchData();

    if(response == null){
      Get.snackbar("Erro", "Não foi possível obter os dados");
      hasError.value = true;
    } else {
      data = response;
      update();
    }
  }
}