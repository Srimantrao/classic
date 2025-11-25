// ignore_for_file: avoid_unnecessary_containers

import 'package:classic/view/utils/widget/hadder/comanScreenHading/comanhadder.dart';
import 'package:flutter/material.dart';

PreferredSizeWidget appBarCategory(prefix, suffix, hedding) {
  return PreferredSize(
    preferredSize: Size.fromHeight(kToolbarHeight),
    child: comanAppBar(
      prefix: prefix,
      suffix: suffix,
      hedding: hedding,
    ),
  );
}