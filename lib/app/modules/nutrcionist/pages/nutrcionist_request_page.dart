import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nutricao/app/modules/nutrcionist/controllers/nutricionist_list_controller.dart';
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
                  child: GetBuilder<NutricionistListController>(builder: (_) {
                    return TextFormField(
                      onChanged: _.setWeight,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintText: '(opicional)',
                        labelText: 'Seu peso (opicional)',
                        suffixText: 'Kg',
                      ),
                    );
                  }),
                ),
                SizedBox(
                  width: 10.0,
                  height: 0.0,
                ),
                Expanded(
                  child: GetBuilder<NutricionistListController>(
                    builder: (_) {
                      return TextFormField(
                        keyboardType: TextInputType.number,
                        onChanged: _.setHieght,
                        decoration: InputDecoration(
                          hintText: '(opicional)',
                          labelText: 'Sua altura (opicional)',
                          suffixText: 'm',
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: 10.0),
              child: GetBuilder<NutricionistListController>(
                builder: (_) {
                  return TextFormField(
                    maxLines: 6,
                    onChanged: _.setReason,
                    decoration: InputDecoration(
                      hintText:
                          'Informe o motivo da sua consulta, ex.: Desejo emagrecer ..',
                      labelText: 'Motivo',
                      errorText: _.errorReason,
                    ),
                  );
                },
              ),
            ),
            Container(
              alignment: Alignment.centerRight,
              margin: EdgeInsets.only(top: 10.0),
              child: FlatButton(
                onPressed: () {
                  var controller = Get.find<NutricionistListController>();

                  if (controller.validForm) {
                    controller
                        .sendAppointment(Get.parameters['nutricionistId']);
                  } else {
                    Get.snackbar(
                        'Ops!', 'Preencha todos os campos corretamente.');
                  }
                },
                color: Theme.of(context).primaryColor,
                child: Text(
                  'Solicitar',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
