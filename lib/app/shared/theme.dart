import 'package:flutter/material.dart';
import 'package:nutricao/app/shared/globals.dart';

ThemeData appTheme(String mode) {
  final ThemeData base = ThemeData(
    fontFamily: 'Montserrat',
    inputDecorationTheme: InputDecorationTheme(border: OutlineInputBorder()),
  );

  if (mode == 'nutritionist') {
    return base.copyWith(
        primaryColor: Globals().blueColor,
        buttonTheme: ButtonThemeData(
          buttonColor: Globals().blueColor,
        ));
  } else {
    return base.copyWith(
        primaryColor: Globals().primaryColor,
        buttonTheme: ButtonThemeData(
          buttonColor: Globals().primaryColor,
        ));
  }
}
