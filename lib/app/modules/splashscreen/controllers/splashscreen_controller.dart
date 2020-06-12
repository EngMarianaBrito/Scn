import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

class SplashScreenController extends RxController {
  Box box;

  dynamic init() async {
    var dir = await getApplicationDocumentsDirectory();
    Hive.init(dir.path);
    box = await Hive.openBox('preferences');

    setPage(box.get('isLogged') == null ? false : box.get('isLogged'));
  }

  void setLogout() {
    box.clear();
    Get.offAndToNamed('/');
  }

  dynamic getPreference(String key) => box.get(key);
  void setPreference(String key, dynamic value) => box.put(key, value);

  void setPage(bool isLogged) {
    Future.delayed(Duration(milliseconds: 500));
    isLogged ? Get.offAndToNamed('/home') : Get.offAndToNamed('/login');
  }
}
