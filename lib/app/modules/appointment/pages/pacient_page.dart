import 'package:flutter/material.dart';

class PacientAppointmentPage extends StatelessWidget {
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
          ),
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
