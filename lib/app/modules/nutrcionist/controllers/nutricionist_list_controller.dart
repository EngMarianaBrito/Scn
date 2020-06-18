import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nutricao/app/modules/nutrcionist/models/nutricionist_list_model.dart';
import 'package:nutricao/app/modules/nutrcionist/repositories/nutricionist_list_repository.dart';
import 'package:nutricao/app/modules/nutrcionist/repositories/nutricionist_request_repository.dart';
import 'package:nutricao/app/modules/splashscreen/controllers/splashscreen_controller.dart';

class NutricionistListController extends GetController {
  static NutricionistListController get to => Get.find();

  Nutricionist data;
  final hasError = false.obs;

  Future<void> fetchNutricionist() async {
    NutricionistData api = NutricionistData();

    var response = await api.fetchData();

    if (response == null) {
      Get.snackbar("Erro", "Não foi possível obter os dados");
      hasError.value = true;
    } else {
      data = response;
      update();
    }
  }

  final searchQuery = ''.obs;

  void changeSearchQuery(String value) {
    searchQuery.value = value;
    update();
  }

  final reason = ''.obs;

  void setReason(String value) {
    reason.value = value;
    update();
  }

  String get errorReason {
    if (reason.value.length > 0 && reason.value.length < 20) {
      return 'Por favor, insira mais detalhes';
    }

    return null;
  }

  bool get validForm {
    if (errorReason == null && reason.value.length > 20) {
      return true;
    }

    return false;
  }

  final weight = ''.obs;

  void setWeight(String value) {
    weight.value = value;
    update();
  }

  final heihgt = ''.obs;

  void setHieght(String value) {
    heihgt.value = value;
    update();
  }

  // NutricionistRequests data;
  Future<void> sendAppointment(String nutricionistId) async {
    // set animation loading
    Get.find<SplashScreenController>().isLoading(loading: true);

    NutricionistDataRequests api = NutricionistDataRequests();

    var response = await api.newRequest(
        nutricionistId, weight.value, heihgt.value, reason.value);

    if (response == null) {
      // set animation loading
      Get.find<SplashScreenController>().isLoading(hasFinished: true);
      Get.snackbar("Erro", "Não foi possível obter os dados");
    } else {
      // set animation loading
      Get.find<SplashScreenController>().isLoading(hasFinished: true);
      Get.defaultDialog(
        middleText:
            'Seu pedido de consulta foi registrado, em breve o profissional responsável entrará em contato!',
        title: 'Sucesso',
        radius: 4.0,
        confirm: FlatButton(
          color: Theme.of(Get.context).primaryColor,
          onPressed: () => Get.toNamed('/home'),
          child: Text(
            'OK',
            style: TextStyle(color: Colors.white),
          ),
        ),
      );
    }
  }
}
