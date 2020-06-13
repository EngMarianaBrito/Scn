import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nutricao/app/modules/register/controllers/register_controller.dart';
import 'package:nutricao/app/shared/globals.dart';

class RegisterPage extends StatelessWidget {
  final Globals globals = Get.find();
  final RegisterController controller = Get.put(RegisterController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        title: GetX<RegisterController>(
          builder: (_) => Image.asset(
            globals.logo,
            fit: BoxFit.contain,
            width: 50.0,
            height: 50.0,
          ),
        ),
        centerTitle: true,
        iconTheme: IconThemeData(
          color: globals.primaryColor,
        ),
        actions: <Widget>[],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: <Widget>[
            Container(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: FlatButton(
                      onPressed: () {
                        Get.find<RegisterController>().setTypeAccount(0);
                      },
                      color: globals.primaryColor,
                      child: Text(
                        "Paciente",
                        style: TextStyle(color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20.0,
                  ),
                  Expanded(
                    child: FlatButton(
                      onPressed: () {
                        Get.find<RegisterController>().setTypeAccount(1);
                      },
                      color: globals.blueColor,
                      child: Text(
                        "Nutricionista",
                        style: TextStyle(color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20.0),
              child: Row(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(right: 10.0),
                    child: GestureDetector(
                      onTap: controller.setProfileImage,
                      child: GetX<RegisterController>(
                        builder: (_) {
                          return controller.profileImage.value != ""
                              ? ClipOval(
                                  child: Image.file(
                                    File(controller.profileImage.value),
                                    fit: BoxFit.cover,
                                    width: 50.0,
                                    height: 50.0,
                                  ),
                                )
                              : Image.asset(
                                  controller.typeAccount.value == 0
                                      ? "assets/images/camera-icon.png"
                                      : "assets/images/camera-icon-blue.png",
                                  fit: BoxFit.contain,
                                  width: 50.0,
                                  height: 50.0,
                                );
                        },
                      ),
                    ),
                  ),
                  Expanded(
                    child: GetX<RegisterController>(
                      builder: (_) {
                        return TextField(
                          onChanged: controller.setName,
                          decoration: InputDecoration(
                              labelText: "Nome",
                              hintText: "Nome completo",
                              errorText: controller.errorName),
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
            GetX<RegisterController>(
              builder: (_) {
                return IgnorePointer(
                  ignoring: controller.typeAccount.value == 0,
                  child: AnimatedContainer(
                    duration: Duration(seconds: 1),
                    height: controller.typeAccount.value == 1 ? 80.0 : 0.0,
                    margin: EdgeInsets.only(
                        top: 20.0,
                        bottom: controller.errorCrn != null ? 15.0 : 0.0),
                    child: Visibility(
                      visible: controller.typeAccount.value == 1,
                      child: GetX<RegisterController>(
                        builder: (_) {
                          return TextField(
                            onChanged: controller.setCRN,
                            decoration: InputDecoration(
                                labelText: "CRN",
                                hintText: "Insira seu CRN",
                                errorText: controller.errorCrn),
                          );
                        },
                      ),
                    ),
                  ),
                );
              },
            ),
            Container(
              child: GetX(
                builder: (_) {
                  return TextField(
                    onChanged: controller.setEmail,
                    decoration: InputDecoration(
                        labelText: "Email",
                        hintText: "Email",
                        errorText: controller.errorMail),
                  );
                },
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20.0),
              child: GetX<RegisterController>(
                builder: (_) {
                  return TextField(
                    onChanged: controller.setPassword,
                    obscureText: true,
                    decoration: InputDecoration(
                        labelText: "Senha",
                        hintText: "Senha",
                        errorText: controller.errorPassword),
                  );
                },
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20.0),
              child: GetX<RegisterController>(
                builder: (_) {
                  return TextField(
                    onChanged: controller.setConfirmPassword,
                    obscureText: true,
                    decoration: InputDecoration(
                        labelText: "Senha",
                        hintText: "Confirme sua senha",
                        errorText: controller.errorConfirmPassword),
                  );
                },
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20.0),
              child: GetX<RegisterController>(
                builder: (_) {
                  return TextField(
                    maxLength: 8,
                    onChanged: controller.setCep,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        labelText: "CEP",
                        hintText: "CEP",
                        errorText: controller.errorCep),
                  );
                },
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20.0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: GetX<RegisterController>(
                      builder: (_) {
                        return TextField(
                          controller: controller.addersController,
                          onChanged: controller.setAdders,
                          decoration: InputDecoration(
                              labelText: "Endereço",
                              hintText: "Endereço completo",
                              errorText: controller.errorAdders),
                        );
                      },
                    ),
                  ),
                  Container(
                    width: 120.0,
                    margin: EdgeInsets.only(left: 20.0),
                    child: GetX<RegisterController>(
                      builder: (_) {
                        return TextField(
                          onChanged: controller.setHouseNumber,
                          decoration: InputDecoration(
                              labelText: "Número",
                              hintText: "N° residencia",
                              errorText: controller.errorHouseNumber),
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Ao registar-se, você concorda\n com todos os termos de uso.",
                    style: TextStyle(color: globals.blueColor),
                  ),
                  Container(
                    child: GetX<RegisterController>(
                      builder: (_) {
                        return FlatButton(
                          color: controller.typeAccount.value == 0
                              ? globals.primaryColor
                              : globals.blueColor,
                          onPressed: () {
                            if (controller.formValid) {
                              controller.register();
                            } else {
                              Get.snackbar("Preencha todos os campos!",
                                  "Por favor, preencha todos os campos");
                            }
                          },
                          child: Text(
                            "Registar-se",
                            style: TextStyle(color: Colors.white),
                          ),
                        );
                      },
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
