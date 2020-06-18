import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nutricao/app/modules/home/controllers/home_controller.dart';
import 'package:nutricao/app/modules/login/controllers/login_controller.dart';
import 'package:nutricao/app/modules/splashscreen/controllers/splashscreen_controller.dart';
import 'package:nutricao/app/shared/globals.dart';

class HomePage extends StatelessWidget {
  final HomeController controller = Get.put(HomeController());
  final SplashScreenController splashController =
      Get.find<SplashScreenController>();

  final Globals globals = Get.find();

  @override
  Widget build(BuildContext context) {
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
      bottomNavigationBar: GetX<HomeController>(
        builder: (_) => BottomNavigationBar(
          onTap: (index) => controller.changeIndex(index),
          currentIndex: controller.currentIndex.value,
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                color: controller.currentIndex.value == 0
                    ? Theme.of(context).primaryColor
                    : Colors.grey,
              ),
              title: Text(
                'Início',
                style: TextStyle(
                  color: controller.currentIndex.value == 0
                      ? Theme.of(context).primaryColor
                      : Colors.grey,
                ),
              ),
            ),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.schedule,
                  color: controller.currentIndex.value == 1
                      ? Theme.of(context).primaryColor
                      : Colors.grey,
                ),
                title: Text(
                  splashController.box.get('account_type') == 0
                      ? 'Minhas consultas'
                      : 'Consultas agendadas',
                  style: TextStyle(
                    color: controller.currentIndex.value == 1
                        ? Theme.of(context).primaryColor
                        : Colors.grey,
                  ),
                )),
            BottomNavigationBarItem(
                icon: Icon(splashController.box.get('account_type') == 0
                      ? Icons.image
                      : Icons.person,),
                title: Text(
                  splashController.box.get('account_type') == 0
                      ? 'Galeria'
                      : 'Pacientes',
                  style: TextStyle(
                    color: controller.currentIndex.value == 3
                        ? Theme.of(context).primaryColor
                        : Colors.grey,
                  ),
                )),
          ],
        ),
      ),
      body: GetX<HomeController>(
        initState: (_) {
          Get.delete<LoginController>();
        },
        builder: (_) {
          return splashController.accountType == 1
              ? controller.tabsNutricionist[controller.currentIndex.value]
              : controller.tabsPatient[controller.currentIndex.value];
        },
      ),
    );
  }
}
