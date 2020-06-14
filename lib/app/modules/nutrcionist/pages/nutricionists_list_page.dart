import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nutricao/app/modules/nutrcionist/controllers/nutricionist_list_controller.dart';
import 'package:nutricao/app/modules/nutrcionist/pages/widgets/card_nutricionist_widget.dart';
import 'package:nutricao/app/modules/splashscreen/controllers/splashscreen_controller.dart';

class NutricionistListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 10.0, right: 10.0),
        child: GetBuilder<NutricionistListController>(
          init: NutricionistListController(),
          initState: (_) {
            NutricionistListController.to.fetchNutricionist();
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
                  return NutricionistListController.to.fetchNutricionist();
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
      );
  }
}