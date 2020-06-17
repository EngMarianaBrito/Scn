import 'package:flutter/material.dart';

class NutricionistListPatient extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          margin:
              EdgeInsets.only(top: 5.0, left: 4.0, right: 4.0, bottom: 10.0),
          child: TextField(
            decoration: InputDecoration(
                labelText: "Pesquise",
                hintText: "Insira o nome do profissional",
                suffixIcon: Icon(Icons.search)),
          ),
        ),
        ListTile(
          title: Text('Paciente X'),
          leading: CircleAvatar(),
          trailing: Icon(
            Icons.keyboard_arrow_right,
            color: Theme.of(context).primaryColor,
          ),
          onTap: () => print('to chat'),
        )
      ],
    );
  }
}
