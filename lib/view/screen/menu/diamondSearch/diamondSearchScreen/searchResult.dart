import 'package:classic/view/utils/app_json.dart';
import 'package:classic/view/utils/widget/cartList.dart';
import 'package:classic/view/utils/widget/fullScreen.dart';
import 'package:classic/view/utils/widget/hadder/comanScreenHading/comanhadder.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:lottie/lottie.dart';
import '../../../../../controller/application_Programing_interface/apiController/menu/diamondSearch/diamondSearch_Controller.dart';
import '../../../../../controller/application_Programing_interface/apiController/menu/jewellery/productDetail/createCart_Controller.dart';
import '../../../../utils/app_Borderradius.dart';
import '../../../../utils/app_Color.dart';
import '../../../../utils/app_icon.dart';
import '../../../../utils/widget/horizontalpaddind.dart';
import '../../../../utils/widget/image/productImage.dart';
import '../../../../utils/widget/image/productVideo.dart';
import '../../dashbord/dashbordScreen/diamondDetail.dart';

class SearchResult extends StatelessWidget {
  final diamondSearchAPI = Get.put(DiamondSearchController());

  SearchResult({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final api = diamondSearchAPI;
      final faechApi = api.diamondSearchData;
      final apiData = faechApi['data'];
      final List data = (apiData ?? []) as List;
      if (data.isEmpty) {
        Lottie.asset(AppJson.noData);
      }
      final totalCount = faechApi['totalCount'];
      return Fullscreen(
        appBar: allOtherScreen('Search Result (${totalCount ?? 0})'),
        child: Column(
          children: [
            valueListDiamond(
              valueList: data,
              video: true,
              camara: true,
              isCart: true,
              isWishlist: true,
            ),
          ],
        ),
      );
    });
  }
}

Widget valueListDiamond({
  required List valueList,
  bool isWishlist = false,
  bool isCart = false,
  bool camara = false,
  bool video = false,
}) {
  final adToCart = Get.put(CreateCartController());
  return Expanded(
    child: ListView.builder(
      itemCount: valueList.length,
      itemBuilder: (BuildContext context, int index) {
        return horizontalPadding(
          child: GestureDetector(
            onTap: () {
              Get.to(
                () => Diamonddetail(
                  shape: valueList[index]['shape'],
                  careat: valueList[index]['carat'].toString(),
                  lab: valueList[index]['lab'],
                  colorcode: valueList[index]['countryCode'].toString(),
                  clarity: valueList[index]['clarity'],
                  cartifactNo: valueList[index]['certno'].toString(),
                ),
              );
            },
            child: Container(
              margin: EdgeInsetsGeometry.symmetric(
                vertical: Get.height * 0.009,
              ),
              decoration: BoxDecoration(
                boxShadow: kElevationToShadow[2],
                color: AppColor.white,
                borderRadius: BorderRadius.circular(borderradius.boder),
              ),
              child: Padding(
                padding: EdgeInsets.all(Get.width * 0.03),
                child: Column(
                  children: [
                    listHeddind(
                      shape: valueList[index]['shape'],
                      careat: valueList[index]['carat'].toString(),
                      lab: valueList[index]['lab'],
                      colorcode: valueList[index]['countryCode'].toString(),
                      clarity: valueList[index]['clarity'],
                      cartifactNo: (valueList[index]['certno'] == null || valueList[index]['certno'] == '-')
                          ? ''
                          : valueList[index]['certno'].toString(),
                      cartifactIcon: (valueList[index]['certno'] == null ||
                          valueList[index]['certno'] == '-')
                          ? AppIcon.user1
                          : AppIcon.diamondId,
                    ),
                    Divider(color: AppColor.gray3),
                    Row(
                      children: [
                        fristrow(
                          cps: valueList[index]['polish'],
                          meas: valueList[index]['measurement'].toString(),
                          refNo: valueList[index]['stockId'].toString(),
                        ),
                        secondrow(
                          T: valueList[index]['depth'].toString(),
                          D: valueList[index]['tablepercent'].toString(),
                          loc: valueList[index]['country'],
                        ),
                        SizedBox(width: Get.width * 0.01),
                        SizedBox(
                          height: Get.height * 0.06,
                          child: VerticalDivider(
                            color: AppColor.gray3,
                            thickness: Get.width * 0.002,
                            width: Get.width * 0.01,
                          ),
                        ),
                        SizedBox(width: Get.width * 0.01),
                        thardrow(
                          ct: valueList[index]['parcarat'].toString(),
                          total: valueList[index]['finalamount'].toString(),
                        ),
                      ],
                    ),
                    Divider(color: AppColor.gray3),
                    buttonOnList(
                      isWishlist: isWishlist,
                      isCart: isCart,
                      camara: camara,
                      video: video,
                      cartOnTap: () {
                        adToCart.createCart(
                          price: valueList[index]['finalamount'].toString(),
                          productId: valueList[index]['_id'],
                          DiamondId: valueList[index]['dimCountryId'],
                        );
                        print({
                          'price': valueList[index]['finalamount'].toString(),
                          'productId': valueList[index]['_id'],
                          'DiamondId': valueList[index]['dimCountryId'],
                        });
                      },
                      camaraOnTap: () {
                        final String? image = valueList[index]['imageurl1'];
                        if (image == null || image.isEmpty) {
                          if (kDebugMode) {
                            print("No Image");
                          }
                          return;
                        }
                        Get.to(() => ProductImage(images: image));
                      },
                      videoOnTap: () {
                        final String? video = valueList[index]['videourl'];
                        if (video == null || video.isEmpty) {
                          if (kDebugMode) {
                            print("No Video");
                          }
                          return;
                        } else {
                          Get.to(() => ProductVideo(videoUrl: video));
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    ),
  );
}

Widget buttonOnList({
  bool isWishlist = false,
  bool isCart = false,
  bool camara = false,
  bool video = false,
  void Function()? camaraOnTap,
  void Function()? videoOnTap,
  void Function()? cartOnTap,
}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      ?(isWishlist == true)
          ? GestureDetector(child: listImage(AppIcon.wishlist))
          : null,
      ?(isCart == true)
          ? GestureDetector(onTap: cartOnTap, child: listImage(AppIcon.newcart))
          : null,
      ?(camara == true)
          ? GestureDetector(
              onTap: camaraOnTap,
              child: Image.asset(
                AppIcon.camera,
                scale: 28,
                color: AppColor.primary,
              ),
            )
          : null,
      ?(video == true)
          ? GestureDetector(onTap: videoOnTap, child: listImage(AppIcon.video))
          : null,
    ],
  );
}
