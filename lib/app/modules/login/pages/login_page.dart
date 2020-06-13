import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nutricao/app/modules/login/controllers/login_controller.dart';
import 'package:nutricao/app/shared/globals.dart';

class LoginPage extends StatelessWidget {
  final Globals globals = Get.put<Globals>(Globals());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 100.0, bottom: 10.0),
              child: Image.asset(
                globals.logo,
                fit: BoxFit.contain,
                width: 100.0,
                height: 100.0,
              ),
            ),
            Container(
              child: Text(
                "Seja bem vindo(a)",
                style: TextStyle(fontSize: 36.0, color: globals.primaryColor),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 40.0),
              child: Text(
                "Sistema remoto de nutrição",
                style: TextStyle(fontSize: 18.0, color: globals.primaryColor),
              ),
            ),
            GetX<LoginController>(
              init: LoginController(),
              builder: (_) {
                return TextField(
                  onChanged: _.setEmail,
                  decoration: InputDecoration(
                      labelText: "Email",
                      hintText: "Insira seu email",
                      errorText: _.errorMail),
                );
              },
            ),
            Container(
              margin: EdgeInsets.only(top: 20.0),
              child: GetX<LoginController>(
                builder: (_) {
                  return TextField(
                    obscureText: true,
                    onChanged: _.setPassword,
                    decoration: InputDecoration(
                      labelText: "Senha",
                      hintText: "Insira sua senha",
                    ),
                  );
                },
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  FlatButton(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onPressed: () {
                      Get.snackbar(
                          "Quase", "Essa função ainda não foi implementada");
                    },
                    child: Text(
                      "Esqueci a senha",
                      style:
                          TextStyle(fontSize: 18.0, color: globals.blueColor),
                    ),
                  ),
                  FlatButton(
                    color: Globals().primaryColor,
                    onPressed: () {
                      if (Get.find<LoginController>().validFrom) {
                        Get.find<LoginController>().login();
                      } else {
                        Get.snackbar("Preencha todos os campos",
                            "Preencha os campos corretamente!");
                      }
                    },
                    child: Text(
                      "Entrar",
                      style: TextStyle(color: Colors.white),
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 40.0),
              alignment: Alignment.center,
              child: FlatButton(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onPressed: () => Get.toNamed("/register"),
                child: Text(
                  "Ainda não tem uma conta? Cadastre-se",
                  style: TextStyle(fontSize: 18.0, color: globals.blueColor),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
