import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nutricao/app/modules/appointment/pages/patient_review.dart';

class PatientAppointmentPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 10.0, right: 10.0),
      child: Column(
        children: <Widget>[
          ListTile(
            title: Text('Dr. Anderson'),
            subtitle: Text('Objetivo: Emagrecer'),
            leading: CircleAvatar(
              backgroundColor: Theme.of(context).primaryColor,
              foregroundColor: Theme.of(context).primaryColor,
              backgroundImage:
                  NetworkImage('https://i.stack.imgur.com/Qt4JP.png'),
            ),
            trailing: Icon(
              Icons.keyboard_arrow_right,
              color: Theme.of(context).primaryColor,
            ),
            onTap: () => Get.to(ReviewAppointment()),
          )
        ],
      ),
    );
  }
}

//no data
// Container(
//         alignment: Alignment.center,
//         child: Text('Ainda não nada por aqui :)'),
//       )

//has error
// Container(
//         alignment: Alignment.center,
//         child: Text('Ocorreu um erro ao tentar recuperar suas consultas :('),
//       )
