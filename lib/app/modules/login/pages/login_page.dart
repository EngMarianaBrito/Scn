import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nutricao/app/shared/globals.dart';

class LoginPage extends StatelessWidget {
  final Globals globals = Get.put(Globals());
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
                "assets/images/logo.png",
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
            TextField(
              decoration: InputDecoration(
                labelText: "Email",
                hintText: "Insira seu email",
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20.0),
              child: TextField(
                decoration: InputDecoration(
                  labelText: "Senha",
                  hintText: "Insira sua senha",
                ),
              ),
            ),
            Container(
              alignment: Alignment.centerRight,
              margin: EdgeInsets.only(top: 10.0),
              child: FlatButton(
                color: Globals().primaryColor,
                onPressed: () {},
                child: Text(
                  "Entrar",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 40.0),
              alignment: Alignment.center,
              child: GestureDetector(
                onTap: () => Get.toNamed("/register"),
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
