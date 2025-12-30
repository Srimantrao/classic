// ignore_for_file: file_names, strict_top_level_inference, prefer_typing_uninitialized_variables

import 'package:classic/controller/application_Programing_interface/apiService/other/countryService.dart';
import 'package:get/get.dart';

class CountryController extends GetxController {
  final countryService = Get.put(CountryService());
  var isLoading = false.obs;
  RxMap<String, dynamic> countryData = <String, dynamic>{}.obs;

  @override
  void onInit() {
    getCountry();
    super.onInit();
  }

  Future<void> getCountry() async {
    isLoading.value = true;
    try {
      final response = await countryService.countryService();
      countryData.value = response.data;
    } finally {
      isLoading.value = false;
    }
  }
}
