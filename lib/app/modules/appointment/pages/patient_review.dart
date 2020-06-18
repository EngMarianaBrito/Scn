import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:nutricao/app/modules/nutrcionist/models/nutricionist_request_model.dart';
import 'package:nutricao/app/shared/globals.dart';

class ReviewAppointment extends StatelessWidget {
  final Datum data;
  ReviewAppointment(this.data);

  final Globals globals = Get.find();
  @override
  Widget build(BuildContext context) {
    final double _width = MediaQuery.of(context).size.width;
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
              contentPadding: EdgeInsets.zero,
              leading: CircleAvatar(
                backgroundColor: Theme.of(context).primaryColor,
                foregroundColor: Theme.of(context).primaryColor,
                backgroundImage:
                    NetworkImage(data.profileImage),
              ),
              title: Text(data.nutricionistName),
              subtitle: Text('Responsável por este diagnóstico'),
            ),
            Container(
              alignment: Alignment.centerRight,
              child: Text(
                (data.status == 0 ? 'Ainda não aceito pelo Nutricionista.' : data.status == 1 ? 'Em andamento' : 'Finalizado'),
                style: TextStyle(color: Theme.of(context).primaryColor),
              ),
            ),
            Container(
              width: _width,
              margin: EdgeInsets.only(top: 20.0),
              child: Text(
                'Relatório da consulta',
                style: TextStyle(fontSize: 22.0),
              ),
            ),
            Container(
              width: _width,
              margin: EdgeInsets.only(top: 20.0),
              child: Text(
                data.report ?? 'Ainda não há um relatório.',
                style: TextStyle(fontSize: 16.0),
              ),
            ),
            Container(
              width: _width,
              margin: EdgeInsets.only(top: 20.0),
              child: Text(
                'Observações',
                style: TextStyle(fontSize: 22.0),
              ),
            ),
            Container(
              width: _width,
              margin: EdgeInsets.only(top: 20.0),
              child: Text(
                data.comments ?? 'Ainda não há observações sobre esta consulta.',
                style: TextStyle(fontSize: 16.0),
              ),
            ),
            Container(
              width: _width,
              margin: EdgeInsets.only(top: 20.0),
              child: Text(
                'Conteúdo recomendado',
                style: TextStyle(fontSize: 22.0),
              ),
            ),
            Container(
              width: _width,
              margin: EdgeInsets.only(top: 20.0),
              child: Text(
                data.extraContent ?? 'Não há conteúdo extra adicionado a esta consulta.',
                style: TextStyle(fontSize: 16.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
