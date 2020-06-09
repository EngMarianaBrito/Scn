import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nutricao/app/shared/theme.dart';

class RegisterController extends RxController {
  final typeAccount = 0.obs;
  void setTypeAccount(int value) {
    typeAccount.value = value;

    if (value == 1) {
      Get.changeTheme(appTheme('nutritionist'));
    } else {
      Get.changeTheme(appTheme('patient'));
    }
  }

  final profileImage = ''.obs;
  void setProfileImage() async {
    try {
      final pickedFile = await ImagePicker()
          .getImage(source: ImageSource.camera, imageQuality: 100);
      profileImage.value = pickedFile.path.toString();
    } catch (e) {
      Get.snackbar("Tente novamente!", "Não foi possível guardar sua imagem.");
    }
  }

  final name = ''.obs;
  void setName(String value) {
    name.value = value.trim();
  }

  String get errorName {
    if (name.value.length > 0 && name.value.length < 4) {
      return 'Por favor, insira o seu nome completo';
    }

    return null;
  }

  final email = ''.obs;
  void setEmail(String value) {
    email.value = value.trim();
  }

  String get errorMail {
    RegExp exp = RegExp(
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');

    if (exp.hasMatch(email.value) == false && email.value.length > 0) {
      return 'Email inválido';
    }

    return null;
  }

  final password = ''.obs;
  void setPassword(String value) => password.value = value;

  String get errorPassword {
    if (password.value.length > 0 && password.value.length < 6) {
      return 'Insira uma senha com pelo menos 6 caracters.';
    }

    return null;
  }

  final confirmPassword = ''.obs;
  void setConfirmPassword(String value) => confirmPassword.value = value;

  String get errorConfirmPassword {
    if (password.value != confirmPassword.value) {
      return 'As senhas não se correspondem';
    }

    return null;
  }

  final cep = ''.obs;
  void setCep(String value) => cep.value = value;

  Future<void> fillAdders() async {
    if (cep.value.length < 8) return null;

    String url = 'https://viacep.com.br/ws/' + cep.value + '/json';

    try {
      var dio = Dio();
      var response = await dio.get(url);
      addersController.text = response.data['bairro'] +
          ' - ' +
          response.data['logradouro'] +
          ' - ' +
          response.data['complemento'] +
          ' - ' +
          response.data['localidade'] +
          '-' +
          response.data['uf'];
      adders.value = addersController.text;
    } catch (e) {
      addersController.clear();
      Get.snackbar("Erro!", "Não foi possível encontrar o seu CEP");
    }
  }

  String get errorCep {
    if (cep.value.length > 0 && cep.value.length <= 7) {
      addersController.clear();
      return 'Insira um CEP válido';
    } else {
      fillAdders();
    }
    return null;
  }

  final TextEditingController addersController = TextEditingController();
  final adders = ''.obs;
  void setAdders(String value) => adders.value = value;

  String get errorAdders {
    if (adders.value.length > 0 && adders.value.length < 3) {
      return 'Endereço inválido';
    }

    return null;
  }

  final houseNumber = ''.obs;
  void setHouseNumber(String value) => houseNumber.value = value;

  String get errorHouseNumber {
    if (houseNumber.value.length > 0 && houseNumber.value.length < 2) {
      return 'Inválido';
    }

    return null;
  }

  final crn = ''.obs;
  void setCRN(String value) => crn.value = value;

  String get errorCrn {
    if (crn.value.length > 0 && crn.value.length < 3) {
      return 'CRN inválida';
    }

    return null;
  }

  bool get formValid {
    final errorFields = [
      errorName,
      errorMail,
      errorPassword,
      errorConfirmPassword,
      errorCep,
      errorAdders,
      errorHouseNumber,
      errorCrn
    ];

    final obsFields = [
      typeAccount.value,
      profileImage.value,
      name.value,
      email.value,
      password.value,
      confirmPassword.value,
      cep.value,
      adders.value,
      houseNumber.value,
      typeAccount.value == 1 ? crn.value : ' '
    ];

    for (var i = 0; i < errorFields.length; i++) {
      if (errorFields[i] != null) {
        return false;
      }
    }

    for (var i = 0; i < obsFields.length; i++) {
      if (obsFields[i] == '') {
        return false;
      }
    }

    return true;
  }
}
