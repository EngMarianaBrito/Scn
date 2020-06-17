import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nutricao/app/modules/nutrcionist/models/nutricionist_rating_model.dart';
import 'package:nutricao/app/modules/nutrcionist/repositories/nutricionist_rating_repository.dart';

class NutricionistProfileController extends GetController {
  NutricionistRatings data;

  Future<void> fetchRating(int nutricionistId) async {
    NutricionistDataRating api = NutricionistDataRating();

    var response = await api.fetchData(nutricionistId);

    if (response == null) {
      Get.snackbar("Erro", "Não foi possível obter os dados");
    } else {
      data = response;
      update();
    }
  }

  final comment = ''.obs;
  void setComment(String value) => comment.value = value;

  final rating = 0.0.obs;
  void setRating(double value) => rating.value = value;

  Future<void> sendNutricionistRating(int nutricionistId) async {
    NutricionistDataRating api = NutricionistDataRating();

    var response =
        await api.sendRating(comment.value, rating.value, nutricionistId);

    if (response == null) {
      Get.snackbar("Erro",
          "Não foi possível enviar a avaliação, tente novamente mais tarde.");
    } else {
      Get.defaultDialog(
        middleText: 'Sua avaliação foi enviada!',
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
