import 'package:get/get.dart';

class HomeController extends RxController {
  final currentIndex = 0.obs;

  void changeIndex(int index){
    currentIndex.value = index;
  }
}