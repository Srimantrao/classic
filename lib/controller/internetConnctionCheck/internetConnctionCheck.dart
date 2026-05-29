import 'dart:async';
import 'dart:io';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

class InternetController extends GetxController {
  RxBool isConnected = true.obs;

  late StreamSubscription connectivitySubscription;
  late StreamSubscription internetSubscription;

  @override
  void onInit() {
    super.onInit();

    // Initial Check
    checkInternet();

    // Network Change Listener
    connectivitySubscription = Connectivity().onConnectivityChanged.listen((
      event,
    ) async {
      checkInternet();
    });

    // Real Internet Listener
    internetSubscription = InternetConnection().onStatusChange.listen((status) {
      isConnected.value = status == InternetStatus.connected;
    });
  }

  Future<void> checkInternet() async {
    bool result = await InternetConnection().hasInternetAccess;

    isConnected.value = result;
  }

  @override
  void onClose() {
    connectivitySubscription.cancel();
    internetSubscription.cancel();
    super.onClose();
  }
}
