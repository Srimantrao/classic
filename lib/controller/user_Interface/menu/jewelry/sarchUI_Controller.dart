import 'package:get/state_manager.dart';

class SarchuiController extends GetxController {
  //Serch Listener
  var isSearch = false.obs;

  void toggleSearch() {
    isSearch.value = !isSearch.value;
  }
}
