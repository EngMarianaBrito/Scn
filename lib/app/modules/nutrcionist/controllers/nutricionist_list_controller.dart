import 'package:get/get.dart';
import 'package:nutricao/app/modules/nutrcionist/models/nutricionist_list_model.dart';
import 'package:nutricao/app/modules/nutrcionist/repositories/nutricionist_list_repository.dart';

class NutricionistListController extends GetController {
  static NutricionistListController get to => Get.find();

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

  final searchQuery = ''.obs;

  void changeSearchQuery(String value){
    searchQuery.value = value;
    print(value);
    update();
  }
}