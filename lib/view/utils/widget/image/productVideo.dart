// ignore_for_file: strict_top_level_inference

import 'package:classic/view/utils/widget/fullScreen.dart';
import 'package:classic/view/utils/widget/horizontalpaddind.dart';
import 'package:classic/view/utils/widget/image/productImage.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ProductVideo extends StatelessWidget {
  final String? videoUrl;

  const ProductVideo({super.key, this.videoUrl});

  @override
  Widget build(BuildContext context) {
    return Fullscreen(
      child: horizontalPadding(
        child: Column(
          children: [
            backButton(),
            Padding(
              padding: EdgeInsetsGeometry.only(bottom: Get.height * 0.02),
            ),
            videoLink(videoUrl),
          ],
        ),
      ),
    );
  }
}

Widget videoLink(videoUrl) {
  return Expanded(
    child: videoUrl == null || videoUrl!.isEmpty
        ? const Center(
            child: Text('Video not available', style: TextStyle(fontSize: 16)),
          )
        : WebViewWidget(
            controller: WebViewController()
              ..setJavaScriptMode(JavaScriptMode.unrestricted)
              ..loadRequest(Uri.parse(videoUrl!)),
          ),
  );
}
