import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nutricao/app/modules/home/controllers/home_controller.dart';
import 'package:nutricao/app/modules/home/page/widgets/card_nutricionist_widget.dart';
import 'package:nutricao/app/modules/login/controllers/login_controller.dart';
import 'package:nutricao/app/modules/register/controllers/register_controller.dart';
import 'package:nutricao/app/modules/splashscreen/controllers/splashscreen_controller.dart';
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
          globals.logo,
          fit: BoxFit.contain,
          width: 50.0,
          height: 50.0,
        ),
        centerTitle: true,
        iconTheme: IconThemeData(
          color: globals.primaryColor,
        ),
        actions: <Widget>[
          Container(
              child: FlatButton(
            onPressed: () {
              SplashScreenController splashController =
                  Get.find<SplashScreenController>();
              splashController.setLogout();
            },
            child: Icon(
              Icons.exit_to_app,
              size: 22.0,
              color: Theme.of(context).primaryColor,
            ),
          ))
        ],
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 10.0, right: 10.0),
        child: GetBuilder<HomeController>(
          init: HomeController(),
          initState: (_) {
            HomeController.to.fetchNutricionist();
            Get.delete<LoginController>();
            Get.delete<RegisterController>();
          },
          builder: (_) {
            if (_.data == null) {
              return Center(
                child: _.hasError.value
                    ? Container(
                        child: Text('Ocorreu um erro ao obter os dados'),
                      )
                    : CircularProgressIndicator(
                        valueColor: new AlwaysStoppedAnimation<Color>(
                            Get.theme.primaryColor),
                      ),
              );
            } else if (_.data.data.length == 0) {
              return Container(
                alignment: Alignment.center,
                child: Text("Ainda não há profissionais disponíveis."),
              );
            } else {
              return RefreshIndicator(
                onRefresh: () {
                  return HomeController.to.fetchNutricionist();
                },
                color: Theme.of(context).primaryColor,
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: _.data.data.length + 1,
                  itemBuilder: (context, index) {
                    if (index == 0) {
                      return Container(
                        margin: EdgeInsets.only(
                            top: 5.0, left: 4.0, right: 4.0, bottom: 10.0),
                        child: TextField(
                          decoration: InputDecoration(
                              labelText: "Pesquise",
                              hintText: "Insira o nome do profissional",
                              suffixIcon: Icon(Icons.search)),
                        ),
                      );
                    } else {
                      var infos = _.data.data;
                      var userID =
                          Get.find<SplashScreenController>().box.get('user_id');
                      return userID == infos[index - 1].userId
                          ? Opacity(
                              opacity: _.data.data.length == 1 ? 1.0 : 0.0,
                              child: Container(
                                margin: EdgeInsets.only(
                                    top: _.data.data.length == 1 ? 20.0 : 0.0),
                                alignment: Alignment.center,
                                child: Text(
                                    'Ainda não há profissionais disponíveis'),
                              ),
                            )
                          : CardNutricionist(
                              infos[index - 1].name,
                              infos[index - 1].formation,
                              infos[index - 1].stars.toDouble(),
                              infos[index - 1].profileImage);
                    }
                  },
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
