import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nutricao/app/modules/nutrcionist/pages/nutricionist_accept_requests.dart';

class NutricionistRequestsAppointmentPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 10.0, right: 10.0),
      child: Column(
        children: <Widget>[
          ListTile(
            title: Text('Paciente X'),
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
            onTap: () => Get.to(NutricionistAcceptAppointmentPage()),
          )
        ],
      ),
    );
  }
}
