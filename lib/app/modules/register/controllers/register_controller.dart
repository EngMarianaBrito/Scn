import 'dart:io';
import 'package:dio/dio.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nutricao/app/modules/login/controllers/login_controller.dart';
import 'package:nutricao/app/modules/splashscreen/controllers/splashscreen_controller.dart';
import 'package:nutricao/app/shared/theme.dart';

class RegisterController extends RxController {
  final typeAccount = 0.obs;
  void setTypeAccount(int value) {
    typeAccount.value = value;

    value == 1 ? Get.changeTheme(appTheme('nutritionist')) : Get.changeTheme(appTheme('patient'));
  }

  File img;
  var pickedFile;
  final profileImage = ''.obs;
  void setProfileImage() async {
    try {
      pickedFile = await ImagePicker()
          .getImage(source: ImageSource.camera, imageQuality: 40);
      profileImage.value = pickedFile.path.toString();

      img = File(pickedFile.path);
    } catch (e) {
      Get.snackbar("Tente novamente!", "Não foi possível guardar sua imagem.");
    }
  }

  Future<String> upload() async {
    final FirebaseStorage _storage =
        FirebaseStorage(storageBucket: 'gs://egs-nutricao.appspot.com');

    StorageUploadTask _task;

    var _ref = _storage.ref().child('${UniqueKey().toString()}.png');

    _task = _ref.putFile(img);

    var _downloadLink = await (await _task.onComplete).ref.getDownloadURL();
    return _downloadLink.toString();
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
      var response = await Dio().get(url);
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

  final formation = ''.obs;
  void setFormation(String value) => formation.value = value;

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

  void register() async {
    // set animation loading
    Get.find<SplashScreenController>().isLoading(loading: true);

    try {
      String image = await upload();

      var request =
          await Get.find<SplashScreenController>().dio.post('/register', data: {
        'name': name.value,
        'email': email.value,
        'crn': crn.value,
        'descripition': null,
        'formation': typeAccount.value == 1 ? 'Nutricionista' : 'Paciente',
        "account_type": typeAccount.value,
        'password': password.value,
        'cep': cep.value,
        'adders': adders.value,
        'house_number': houseNumber.value,
        'profile_image': image
      });

      // set animation loading
      Get.find<SplashScreenController>().isLoading(hasFinished: true);

      if (request.data['name'] != null) {
        final LoginController loginController = Get.find<LoginController>();
        loginController.setEmail(email.value);
        loginController.setPassword(password.value);
        loginController.login();
      } else if (request.data['message'].toString().contains('Esse email')) {
        Get.snackbar('Dados inválidos', 'Este email já está cadastrado');
      } else if (request.data.toString().contains('null value in column')) {
        Get.snackbar('Dados inválidos', 'Preenhca todos os dados');
      } else {
        Get.snackbar('Erro', 'Ocorreu algo inesperado');
      }
    } catch (e) {
      // set animation loading
      Get.find<SplashScreenController>().isLoading(hasFinished: true);
      Get.snackbar('Erro', 'Ocorreu um erro ao tentar fazer login');
    }
  }
}
