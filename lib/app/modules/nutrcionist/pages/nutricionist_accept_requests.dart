import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nutricao/app/shared/globals.dart';

class NutricionistAcceptAppointmentPage extends StatelessWidget {
  final Globals globals = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        title: Image.asset(
          globals.logo,
          fit: BoxFit.contain,
          width: 50.0,
          height: 50.0,
        ),
        centerTitle: true,
        iconTheme: IconThemeData(
          color: globals.primaryColor,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
            ListTile(
              title: Text('Paciente X'),
              subtitle: Text('Peso: 70Kg - Altura: 1.8m'),
              leading: CircleAvatar(),
              contentPadding: EdgeInsets.zero,
            ),
            Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(top: 20.0),
              child: Text(
                'Motivo da consulta',
                style: TextStyle(fontSize: 22.0),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10.0),
              child: Text(
                'Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum '
                'Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum ',
                style: TextStyle(fontSize: 16.0),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20.0),
              alignment: Alignment.centerRight,
              child: FlatButton(
                onPressed: () {},
                color: Theme.of(context).primaryColor,
                child: Text(
                  'Aceitar consulta',
                  style: TextStyle(color: Colors.white),
                )
              ),
            )
          ],
        ),
      ),
    );
  }
}
