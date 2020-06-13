import 'package:get/get.dart';
import 'package:nutricao/app/modules/splashscreen/controllers/splashscreen_controller.dart';
import 'package:nutricao/app/shared/theme.dart';

class LoginController extends RxController {
  final email = ''.obs;
  void setEmail(String value) => email.value = value;

  String get errorMail {
    RegExp exp = RegExp(
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');

    if (exp.hasMatch(email.value) == false && email.value.length > 0) {
      return 'Digite um email válido';
    }

    return null;
  }

  final password = ''.obs;
  void setPassword(String value) => password.value = value;

  bool get validFrom {
    if (errorMail == null && password.value.length > 0) {
      return true;
    }

    return false;
  }

  void login() async {
    // set animation loading
    Get.find<SplashScreenController>().isLoading(loading: true);

    try {
      var request = await Get.find<SplashScreenController>().dio.post('/login',
          data: {'email': email.value, 'password': password.value});

      // set animation loading
      Get.find<SplashScreenController>().isLoading(hasFinished: true);

      if (request.data['token'] != null) {
        SplashScreenController splashController =
            Get.find<SplashScreenController>();

        splashController.setPreference('token', request.data['token']);
        splashController.setPreference('isLogged', true);
        splashController.setPreference('user_id', request.data['user_id']);
        Get.changeTheme(appTheme(request.data['account_type'] == 1 ? 'nutritionist' : 'patient'));
        Get.offAllNamed('/home');
      } else if (request.data['error']
          .toString()
          .contains('E_PASSWORD_MISMATCH')) {
        Get.snackbar(
            'Dados inválidos', 'Verifique se digitou os dados corretamente');
      } else if (request.data['error']
          .toString()
          .contains('E_USER_NOT_FOUND')) {
        Get.snackbar(
            'Não cadastrado', 'Você não está cadastrado, crie uma conta');
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
