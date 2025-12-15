// ignore_for_file: strict_top_level_inference

import 'package:classic/view/utils/widget/hadder/comanScreenHading/comanhadder.dart';
import 'package:flutter/material.dart';

PreferredSizeWidget appBarAddCustomJewellery({
  required prefixIcon,
  required suffixIcon,
  required hedding,
  void Function()? prefixOnTap,
  void Function()? suffixOnTap,
}) {
  return PreferredSize(
    preferredSize: Size.fromHeight(kToolbarHeight),
    child: comanAppBar(
      prefix: prefixIcon,
      suffix: suffixIcon,
      hedding: hedding,
      prefixOnTap: prefixOnTap,
      suffixOnTap: suffixOnTap,
    ),
  );
}
