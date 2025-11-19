// ignore_for_file: non_constant_identifier_names

import 'package:classic/view/utils/app_Color.dart';
import 'package:classic/view/utils/app_TextSize.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget Inputfield({
  String? hinttext,
  TextEditingController? controller,
  bool obscureText = false,
  Color? color,
  void Function(String)? onChanged,
  void Function(String)? onSubmitted,
}) {
  return StatefulBuilder(
    builder: (BuildContext context, void Function(void Function()) setState) {
      bool localObscure = obscureText;
      return Builder(
        builder: (BuildContext context) {
          return StatefulBuilder(
            builder:
                (BuildContext context, void Function(void Function()) setState) {
                  return Column(
                    children: [
                      SizedBox(
                        height: Get.height * 0.05,
                        child: TextField(
                          onSubmitted: onSubmitted,
                          onChanged: onChanged,
                          obscureText: localObscure,
                          controller: controller,
                          decoration: InputDecoration(
                            suffixIcon: obscureText
                                ? GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        localObscure = !localObscure;
                                      });
                                    },
                                    child: localObscure
                                        ? Icon(Icons.visibility, size: 18)
                                        : Icon(Icons.visibility_off, size: 18),
                                  )
                                : null,
                            contentPadding: EdgeInsets.symmetric(
                              vertical: Get.width * 0.03,
                              horizontal: Get.width * 0.02,
                            ),
                            hintText: hinttext,
                            hintStyle: TextStyle(fontSize: Textsize.normal),
                            filled: true,
                            fillColor: Colors.white,
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: color ?? AppColor.white,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: color ?? AppColor.white,
                              ),
                            ),
                            disabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: color ?? AppColor.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: Get.height * 0.02),
                    ],
                  );
                },
          );
        },
      );
    },
  );
}
