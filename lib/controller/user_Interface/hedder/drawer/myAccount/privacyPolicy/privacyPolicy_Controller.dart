import 'package:classic/view/utils/app_URL.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PrivacyPolicyController extends GetxController {
  late final WebViewController controller;

  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();

    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageStarted: (url) {
            isLoading.value = true;
          },
          onPageFinished: (url) {
            isLoading.value = false;
          },
        ),
      )
      ..loadRequest(Uri.parse("${AppUrl.classicWebSite}privacy-policy"));
  }
}
