import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nutricao/app/shared/globals.dart';

class NutricionistRequestPage extends StatelessWidget {
  final Globals globals = Get.find<Globals>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        iconTheme: IconThemeData(
          color: Theme.of(context).primaryColor,
        ),
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Image.asset(
          globals.logo,
          fit: BoxFit.contain,
          width: 50.0,
          height: 50.0,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  child: TextFormField(
                    decoration: InputDecoration(
                        hintText: '(opicional)',
                        labelText: 'Seu peso (opicional)',
                        suffixText: 'Kg'),
                  ),
                ),
                SizedBox(width: 10.0, height: 0.0,),
                Expanded(
                  child: TextFormField(
                    decoration: InputDecoration(
                        hintText: '(opicional)',
                        labelText: 'Sua altura (opicional)',
                        suffixText: 'm'),
                  ),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: 10.0),
              child: TextFormField(
                maxLines: 6,
                decoration: InputDecoration(
                    hintText:
                        'Informe o motivo da sua consulta, ex.: Desejo emagrecer ..',
                    labelText: 'Motivo'),
              ),
            ),
            Container(
              alignment: Alignment.centerRight,
              margin: EdgeInsets.only(top: 10.0),
              child: FlatButton(
                  onPressed: () {},
                  color: Theme.of(context).primaryColor,
                  child: Text(
                    'Solicitar',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
