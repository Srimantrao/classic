import 'package:classic/view/utils/widget/fullScreen.dart';
import 'package:classic/view/utils/widget/hadder/comanScreenHading/comanhadder.dart';
import 'package:flutter/material.dart';

import '../../../../../../../../../utils/app_String.dart';

class OrderDetail extends StatelessWidget {
  const OrderDetail({super.key});
  @override
  Widget build(BuildContext context) {
    return Fullscreen(
      appBar: allOtherScreen(AppString.orderDetail),
      child: SizedBox(),
    );
  }
}
