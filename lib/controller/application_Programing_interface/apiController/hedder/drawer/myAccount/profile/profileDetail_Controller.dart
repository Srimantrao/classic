import 'package:classic/controller/application_Programing_interface/apiService/hedder/drawer/myAccount/profile/profileDetail_Service.dart';
import 'package:classic/view/utils/api_Message.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class ProfileDetailController extends GetxController {
  final serviceProfile = ProfileDetailService();
  var isLoading = false.obs;
  var profileDetailData = {}.obs;

  Future<void> profileDetail() async {
    try {
      isLoading(true);
      final response = await serviceProfile.profileService();
      if (response.statusCode == 200) {
        successMesssess(
          response: response,
          data: profileDetailData,
          callAPI: 'profileDetail',
        );
      }
    } on DioException catch (e) {
      errorMesssess(callAPI: 'profileDetail', e: e);
    } finally {
      isLoading(false);
    }
  }
}
