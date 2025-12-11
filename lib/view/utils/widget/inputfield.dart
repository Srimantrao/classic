// ignore_for_file: non_constant_identifier_names

import 'package:classic/view/utils/app_Color.dart';
import 'package:classic/view/utils/app_TextSize.dart';
import 'package:classic/view/utils/widget/widgetSize.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/services.dart';

Widget Inputfield({
  String? hinttext,
  TextStyle? hintStyle,
  TextEditingController? controller,
  bool obscureText = false,
  Color? color,
  void Function(String)? onChanged,
  void Function(String)? onSubmitted,
  int? maxLength,
  TextInputAction? textInputAction,
  TextInputType? keyboardType,
  List<TextInputFormatter>? inputFormatters,
  double? height,
  bool? expands,
  TextAlignVertical? textAlignVertical,
  Color? fillColor,
  Color? hintstyleColor,
  Color? textColor,
  String? hintstylefontFamily,
  String? textfontFamily,
  Widget? prefixIcon,
  Widget? suffixIcon,
  InputBorder? focusedBorder,
  InputBorder? enabledBorder,
  InputBorder? disabledBorder,
}) {
  return StatefulBuilder(
    builder: (BuildContext context, void Function(void Function()) setState) {
      bool localObscure = obscureText;
      return Builder(
        builder: (BuildContext context) {
          return StatefulBuilder(
            builder:
                (
                  BuildContext context,
                  void Function(void Function()) setState,
                ) {
                  return Column(
                    children: [
                      SizedBox(
                        height: height ?? Widgetsize.getContainerHeight(),
                        child: TextField(
                          style: TextStyle(
                            color: textColor,
                            fontFamily: textfontFamily,
                          ),
                          maxLength: maxLength,
                          textInputAction: textInputAction,
                          onSubmitted: onSubmitted,
                          onChanged: onChanged,
                          obscureText: localObscure,
                          controller: controller,
                          keyboardType: keyboardType,
                          expands: !localObscure ? (expands ?? true) : false,
                          maxLines: localObscure ? 1 : null,
                          minLines: localObscure ? 1 : null,
                          inputFormatters: inputFormatters,
                          textAlignVertical: textAlignVertical,
                          decoration: InputDecoration(
                            counterText: '',
                            prefixIcon: prefixIcon,
                            suffixIcon: (suffixIcon != null)
                                ? suffixIcon
                                : obscureText
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
                              vertical: Get.width * 0.02,
                              horizontal: Get.width * 0.02,
                            ),
                            hintText: hinttext,
                            hintStyle:
                                hintStyle ??
                                TextStyle(
                                  fontSize: Textsize.normal,
                                  color: hintstyleColor,
                                  fontFamily: hintstylefontFamily,
                                ),
                            filled: true,
                            fillColor: fillColor ?? AppColor.white,
                            focusedBorder:
                                focusedBorder ??
                                OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: color ?? AppColor.white,
                                  ),
                                ),
                            enabledBorder:
                                enabledBorder ??
                                OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: color ?? AppColor.white,
                                  ),
                                ),
                            disabledBorder:
                                disabledBorder ??
                                OutlineInputBorder(
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
