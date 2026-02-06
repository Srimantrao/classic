import 'package:classic/controller/application_Programing_interface/apiController/menu/jewellery/productDetail/createCart_Controller.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import '../../../../../utils/app_Borderradius.dart';
import '../../../../../utils/app_Color.dart';
import '../../../../../utils/app_icon.dart';
import '../../../../../utils/widget/cartList.dart';
import '../../../../../utils/widget/horizontalpaddind.dart';
import '../../../../../utils/widget/image/productImage.dart';
import '../../../../../utils/widget/image/productVideo.dart';
import '../../../dashbord/dashbordScreen/diamondDetail.dart';

Widget valueListDiamond({
  required List valueList,
  bool isWishlist = false,
  bool isCart = false,
  bool camara = false,
  bool video = false,
  ScrollController? scrollController,
}) {
  final adToCart = Get.put(CreateCartController());
  return Expanded(
    child: ListView.builder(
      controller: scrollController,
      itemCount: valueList.length,
      itemBuilder: (BuildContext context, int index) {
        return listDiamond(
          isCart: isCart,
          camara: camara,
          video: video,
          isWishlist: isWishlist,
          ids: valueList[index]['_id']?.toString() ?? '',
          images: valueList[index]['imageurl1']?.toString() ?? '',
          videos: valueList[index]['videourl']?.toString() ?? '',
          shape: valueList[index]['shape']?.toString() ?? '',
          careat: valueList[index]['carat']?.toString() ?? '',
          lab: valueList[index]['lab']?.toString() ?? '',
          colorcode: valueList[index]['countryCode']?.toString() ?? '',
          clarity: valueList[index]['clarity']?.toString() ?? '',
          cartifactIcon: (valueList[index]['certno'] == null || valueList[index]['certno'] == '-')
              ? AppIcon.user1
              : AppIcon.diamondId,
          cartifactNo: (valueList[index]['certno'] == null || valueList[index]['certno'] == '-')
              ? ''
              : valueList[index]['certno'].toString(),
          cps: valueList[index]['polish']?.toString() ?? '',
          meas: valueList[index]['measurement']?.toString() ?? '',
          refNo: valueList[index]['stockId']?.toString() ?? '',
          T: valueList[index]['depth']?.toString() ?? '',
          D: valueList[index]['tablepercent']?.toString() ?? '',
          loc: valueList[index]['country']?.toString() ?? '',
          ct: valueList[index]['parcarat']?.toString() ?? '',
          total: valueList[index]['finalamount']?.toString() ?? '',
          cartOnTap: () {
            adToCart.createCart(
              price: valueList[index]['finalamount']?.toString() ?? '',
              productId: valueList[index]['_id']?.toString() ?? '',
              DiamondId: valueList[index]['dimCountryId']?.toString() ?? '',
            );
          },
          camaraOnTap: () {
            final String? image = valueList[index]['imageurl1']?.toString();
            if (image == null || image.isEmpty) {
              if (kDebugMode) {
                print("No Image");
              }
              return;
            }
            Get.to(() => ProductImage(images: image));
          },
          videoOnTap: () {
            final String? video = valueList[index]['videourl']?.toString();
            if (video == null || video.isEmpty) {
              if (kDebugMode) {
                print("No Video");
              }
              return;
            } else {
              Get.to(() => ProductVideo(videoUrl: video));
            }
          },
        );
      },
    ),
  );
}

Widget listDiamond({
  required String ids,
  required String images,
  required String videos,
  required String shape,
  required String careat,
  required String lab,
  required String colorcode,
  required String clarity,
  required String cartifactNo,
  String? cartifactIcon,
  required String cps,
  required String meas,
  required String refNo,
  required String T,
  required String D,
  required String loc,
  required String ct,
  required String total,
  bool isWishlist = false,
  bool isCart = false,
  bool camara = false,
  bool video = false,
  bool link = false,
  void Function()? camaraOnTap,
  void Function()? videoOnTap,
  void Function()? cartOnTap,
  void Function()? linkOnTap,
  void Function()? idOnTop,
}) {
  return horizontalPadding(
    child: GestureDetector(
      onTap: () {
        final String id = ids;
        final String image = images;
        final String video = videos;
        Get.to(() => DiamondDetail(id: id, image: image, video: video));
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: Get.height * 0.009),
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
                shape: shape,
                careat: careat,
                lab: lab,
                colorcode: colorcode,
                clarity: clarity,
                cartifactNo: cartifactNo,
                cartifactIcon: cartifactIcon.toString(),
                idOnTop: idOnTop
              ),
              Divider(color: AppColor.gray3),
              Row(
                children: [
                  fristrow(cps: cps, meas: meas, refNo: refNo),
                  secondrow(T: T, D: D, loc: loc),
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
                  thardrow(ct: ct, total: total),
                ],
              ),
              Divider(color: AppColor.gray3),
              buttonOnList(
                isWishlist: isWishlist,
                isCart: isCart,
                camara: camara,
                video: video,
                link: link,
                cartOnTap: cartOnTap,
                camaraOnTap: camaraOnTap,
                videoOnTap: videoOnTap,
                linkOnTap: linkOnTap
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

Widget buttonOnList({
  bool isWishlist = false,
  bool isCart = false,
  bool camara = false,
  bool video = false,
  bool link = false,
  void Function()? camaraOnTap,
  void Function()? videoOnTap,
  void Function()? cartOnTap,
  void Function()? linkOnTap,
}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      if (isWishlist) GestureDetector(child: listImage(AppIcon.wishlist)),
      if (isCart)
        GestureDetector(onTap: cartOnTap, child: listImage(AppIcon.newcart)),
      if (camara)
        GestureDetector(
          onTap: camaraOnTap,
          child: Image.asset(
            AppIcon.camera,
            scale: 28,
            color: AppColor.primary,
          ),
        ),
      if (video)
        GestureDetector(onTap: videoOnTap, child: listImage(AppIcon.video)),
      if(link)
        GestureDetector(onTap: linkOnTap,child: listImage(AppIcon.diamondId),)
    ],
  );
}

// horizontalPadding(
//           child: GestureDetector(
//             onTap: () {
//               final String id = valueList[index]['_id']?.toString() ?? '';
//               final String image =
//                   valueList[index]['imageurl1']?.toString() ?? '';
//               final String video =
//                   valueList[index]['videourl']?.toString() ?? '';
//               Get.to(() => DiamondDetail(id: id, image: image, video: video));
//             },
//             child: Container(
//               margin: EdgeInsets.symmetric(vertical: Get.height * 0.009),
//               decoration: BoxDecoration(
//                 boxShadow: kElevationToShadow[2],
//                 color: AppColor.white,
//                 borderRadius: BorderRadius.circular(borderradius.boder),
//               ),
//               child: Padding(
//                 padding: EdgeInsets.all(Get.width * 0.03),
//                 child: Column(
//                   children: [
//                     listHeddind(
//                       shape: valueList[index]['shape']?.toString() ?? '',
//                       careat: valueList[index]['carat']?.toString() ?? '',
//                       lab: valueList[index]['lab']?.toString() ?? '',
//                       colorcode:
//                           valueList[index]['countryCode']?.toString() ?? '',
//                       clarity: valueList[index]['clarity']?.toString() ?? '',
//                       cartifactNo:
//                           (valueList[index]['certno'] == null ||
//                               valueList[index]['certno'] == '-')
//                           ? ''
//                           : valueList[index]['certno'].toString(),
//                       cartifactIcon:
//                           (valueList[index]['certno'] == null ||
//                               valueList[index]['certno'] == '-')
//                           ? AppIcon.user1
//                           : AppIcon.diamondId,
//                     ),
//                     Divider(color: AppColor.gray3),
//                     Row(
//                       children: [
//                         fristrow(
//                           cps: valueList[index]['polish']?.toString() ?? '',
//                           meas:
//                               valueList[index]['measurement']?.toString() ?? '',
//                           refNo: valueList[index]['stockId']?.toString() ?? '',
//                         ),
//                         secondrow(
//                           T: valueList[index]['depth']?.toString() ?? '',
//                           D: valueList[index]['tablepercent']?.toString() ?? '',
//                           loc: valueList[index]['country']?.toString() ?? '',
//                         ),
//                         SizedBox(width: Get.width * 0.01),
//                         SizedBox(
//                           height: Get.height * 0.06,
//                           child: VerticalDivider(
//                             color: AppColor.gray3,
//                             thickness: Get.width * 0.002,
//                             width: Get.width * 0.01,
//                           ),
//                         ),
//                         SizedBox(width: Get.width * 0.01),
//                         thardrow(
//                           ct: valueList[index]['parcarat']?.toString() ?? '',
//                           total:
//                               valueList[index]['finalamount']?.toString() ?? '',
//                         ),
//                       ],
//                     ),
//                     Divider(color: AppColor.gray3),
//                     buttonOnList(
//                       isWishlist: isWishlist,
//                       isCart: isCart,
//                       camara: camara,
//                       video: video,
//                       cartOnTap: () {
//                         adToCart.createCart(
//                           price:
//                               valueList[index]['finalamount']?.toString() ?? '',
//                           productId: valueList[index]['_id']?.toString() ?? '',
//                           DiamondId:
//                               valueList[index]['dimCountryId']?.toString() ??
//                               '',
//                         );
//                       },
//                       camaraOnTap: () {
//                         final String? image = valueList[index]['imageurl1']
//                             ?.toString();
//                         if (image == null || image.isEmpty) {
//                           if (kDebugMode) {
//                             print("No Image");
//                           }
//                           return;
//                         }
//                         Get.to(() => ProductImage(images: image));
//                       },
//                       videoOnTap: () {
//                         final String? video = valueList[index]['videourl']
//                             ?.toString();
//                         if (video == null || video.isEmpty) {
//                           if (kDebugMode) {
//                             print("No Video");
//                           }
//                           return;
//                         } else {
//                           Get.to(() => ProductVideo(videoUrl: video));
//                         }
//                       },
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         );   //
