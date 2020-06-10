import 'package:get/get.dart';

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
    if(errorMail == null && password.value.length > 0){
      return true;
    }

    return false;
  }
}