// ignore_for_file: avoid_print

import 'package:classic/controller/application_Programing_interface/apiService/hedder/drawer/myAccount/helpCenter/sendMessageServices.dart';
import 'package:classic/view/utils/api_Message.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class SendMessageController extends GetxController {
  final sendMSGServies = SendMessageServices();
  var isLoading = false.obs;
  var sendMessageData = {}.obs;

  Future<void> sendMessage({
    required String fullName,
    required String email,
    required String mobile,
    required String message,
    required String countrycode,
    String? token,
  }) async {
    try {
      isLoading.value = true;
      final response = await sendMSGServies.sendMessage(
        fullName: fullName,
        email: email,
        mobile: mobile,
        message: message,
        countrycode: countrycode,
        token: token,
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        successMesssess(
          response: response,
          data: sendMessageData,
          callAPI: 'sendMessageData',
          messages: true,
          showSnackbarSuccess: true,
        );
      }
      else {
        print('Failed to send message. Status code: ${response.statusCode}');
      }
    } on DioException catch (e) {
      errorMesssess(
        e: e,
        callAPI: 'sendMessageData',
        showSnackbar: true,
        showSnackbarErorr: true,
        showSnackbarMessages: true,
      );
      print('Error sending message: $e');
    } finally {
      isLoading.value = false;
    }
  }
}
