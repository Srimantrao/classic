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
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: hasImage
                ? Image.network(
                    AppUrl.imagebaseUrl + image,
                    fit: BoxFit.contain,
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
                          size: Get.width * 0.1,
                          color: Colors.grey,
                        ),
                      );
                    },
                  )
                : Center(child: Icon(Icons.image_not_supported, size: 30, color: Colors.grey)),
          ),
          const SizedBox(height: 4),
          Text(
            text,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
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
