// SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky); // hides Navigation bar
// SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive, overlays: [SystemUiOverlay.top]); // Show Only Header
// SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [SystemUiOverlay.bottom]); // Show Only bootcamp
// SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge); //show Everything

import 'package:classic/view/screen/splash/logo.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'view/utils/widget/bottomBar.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    return GetMaterialApp(
      theme: ThemeData(fontFamily: 'Sans-Bold'),
      debugShowCheckedModeBanner: false,
      home: Logo(),
    );
  }
}
