import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nutricao/app/modules/home/controllers/home_controller.dart';
import 'package:nutricao/app/modules/home/page/widgets/card_nutricionist_widget.dart';
import 'package:nutricao/app/shared/globals.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Globals globals = Get.find();
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        title: Image.asset(
          "assets/images/logo.png",
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
        padding: EdgeInsets.only(left: 10.0, right: 10.0),
        child: GetBuilder<HomeController>(
          init: HomeController(),
          initState: (_) {
            HomeController.to.fetchNutricionist();
          },
          builder: (_) {
            if (_.data == null) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (_.data.data.length == 0) {
              return Container(
                alignment: Alignment.center,
                child: Text("Ainda não há profissionais disponíveis."),
              );
            } else {
              return ListView.builder(
                shrinkWrap: true,
                itemCount: _.data.data.length + 1,
                itemBuilder: (context, index) {
                  if (index == 0) {
                    return Container(
                      margin:
                          EdgeInsets.only(top: 5.0, left: 4.0, right: 4.0, bottom: 10.0),
                      child: TextField(
                        decoration: InputDecoration(
                          labelText: "Pesquise",
                          hintText: "Insira o nome do profissional",
                          suffixIcon: Icon(Icons.search),
                        ),
                      ),
                    );
                  } else {
                    var infos = _.data.data;
                    return CardNutricionist(infos[index-1].name,
                        infos[index-1].formation, infos[index-1].stars.toDouble(), 'https://cdn.tatame.com.br/wp-content/uploads/2020/06/Terry-Crews-e1591376031946.jpg');
                  }
                },
              );
            }
          },
        ),
      ),
    );
  }
}
