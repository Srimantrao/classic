// ignore_for_file: avoid_print, file_names

import 'package:classic/view/utils/widget/pop.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

void successMesssess({
  required Response response,
  required RxMap data,
  String? callAPI,
  bool messages = false,
  bool showSnackbar = false,
  bool showSnackbarMessages = false,
  bool showSnackbarSuccess = false,
}) {
  data.value = response.data;
  print("✅$callAPI Status: ${response.statusCode}");
  (messages)
      ? print("⚠️$callAPI Status :- ${response.data["message"]}")
      : SizedBox();
  (showSnackbarMessages)
      ? ToastificationSuccess.Success(
          "$callAPI Message :- ${response.data?['message'] ?? 'Success'}",
        )
      : SizedBox();
  (showSnackbarSuccess)
      ? ToastificationSuccess.Success("Success, ${response.data["message"]}")
      : SizedBox();
  // log(response.data);
  return;
}

void errorMesssess({
  required DioException e,
  required String callAPI,
  bool showSnackbar = false,
  bool showSnackbarMessages = false,
  bool showSnackbarErorr = false,
}) {
  print("❌ $callAPI Status: ${e.response!.statusCode}");
  print("❌ $callAPI Status Data: ${e.response!.data}");
  (showSnackbarMessages)
      ? ToastificationError.Error(
          "$callAPI Message :-  ${e.response?.data["message"]}",
        )
      : SizedBox();
  (showSnackbarErorr)
      ? ToastificationError.Error("Error, ${e.response?.data["message"]}")
      : SizedBox();
  return;
}
