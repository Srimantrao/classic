import 'package:classic/view/utils/app_Color.dart';
import 'package:classic/view/utils/app_TextSize.dart';
import 'package:classic/view/utils/app_URL.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget product({
  required String text,
  required String? image,
  void Function()? onTap,
}) {
  final bool hasImage = image != null && image.isNotEmpty;

  return GestureDetector(
    onTap: onTap,
    child: Container(
      decoration: BoxDecoration(
        color: AppColor.white,
        border: Border.all(color: AppColor.gray3),
      ),
      padding: EdgeInsets.all(5),
      child: Column(
        children: [
          hasImage
              ? Image.network(
                  AppUrl.imagebaseUrl + image,
                  scale: 2,
                  fit: BoxFit.cover,
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) return child;
                    return Center(
                      child: SizedBox(
                        width: 24,
                        height: 24,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      ),
                    );
                  },
                  errorBuilder: (context, error, stackTrace) {
                    return Center(
                      child: Icon(
                        Icons.broken_image,
                        size: Get.width * 0.2,
                        color: Colors.grey,
                      ),
                    );
                  },
                )
              : SizedBox(),
          Padding(padding: EdgeInsetsGeometry.only(bottom: Get.height * 0.01)),
          Text(
            text,
            style: TextStyle(
              fontSize: Textsize.normal,
              fontWeight: FontWeight.w500,
              fontFamily: 'FuturaCyrillic',
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    ),
  );
}
