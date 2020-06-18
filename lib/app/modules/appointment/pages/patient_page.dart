import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nutricao/app/modules/appointment/pages/patient_review.dart';
import 'package:nutricao/app/modules/nutrcionist/models/nutricionist_request_model.dart';
import 'package:nutricao/app/modules/nutrcionist/repositories/nutricionist_request_repository.dart';

class PatientAppointmentPage extends StatefulWidget {
  @override
  _PatientAppointmentPageState createState() => _PatientAppointmentPageState();
}

class _PatientAppointmentPageState extends State<PatientAppointmentPage> {
  NutricionistRequests data;

  Future<void> getMyAppointments() async {
    NutricionistDataRequests api = NutricionistDataRequests();

    var response = await api.myAppointments();

    if (response == null) {
      Get.snackbar("Erro", "Não foi possível obter os dados");
    } else {
      data = response;
    }
  }

  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsets.only(left: 10.0, right: 10.0),
      child: FutureBuilder(
        future: getMyAppointments(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Container(
              height: _height,
              alignment: Alignment.center,
              child: CircularProgressIndicator(
                valueColor: new AlwaysStoppedAnimation<Color>(
                  Get.theme.primaryColor,
                ),
              ),
            );
          } else {
            return ListView.builder(
              itemCount: data.data.length,
              itemBuilder: (context, index) {
                if (data.data == null) {
                  return Container(
                    margin: EdgeInsets.only(top: 100.0),
                    alignment: Alignment.center,
                    child: Text('Ocorreu um erro inesperado :('),
                  );
                } else if (data.data.length == 0) {
                  return Container(
                    margin: EdgeInsets.only(top: 100.0),
                    alignment: Alignment.center,
                    child: Text('Ainda não nada por aqui :)'),
                  );
                } else {
                  return ListTile(
                    title: Text(data.data[index].nutricionistName),
                    subtitle:
                        Text(data.data[index].reason),
                    leading: CircleAvatar(
                      backgroundColor: Theme.of(context).primaryColor,
                      foregroundColor: Theme.of(context).primaryColor,
                      backgroundImage:
                          NetworkImage(data.data[index].profileImage),
                    ),
                    trailing: Icon(
                      Icons.keyboard_arrow_right,
                      color: Theme.of(context).primaryColor,
                    ),
                    onTap: () => Get.to(ReviewAppointment(data.data[index])),
                  );
                }
              },
            );
          }
        },
      ),
    );
  }
}
