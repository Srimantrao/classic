import 'package:classic/controller/user_Interface/menu/diamondSearch/searchResult_Controller.dart';
import 'package:classic/view/utils/app_json.dart';
import 'package:classic/view/utils/widget/cartList.dart';
import 'package:classic/view/utils/widget/fullScreen.dart';
import 'package:classic/view/utils/widget/hadder/comanScreenHading/comanhadder.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import '../../../../../controller/application_Programing_interface/apiController/menu/jewellery/productDetail/createCart_Controller.dart';
import '../../../../utils/app_Borderradius.dart';
import '../../../../utils/app_Color.dart';
import '../../../../utils/app_icon.dart';
import '../../../../utils/widget/horizontalpaddind.dart';
import '../../../../utils/widget/image/productImage.dart';
import '../../../../utils/widget/image/productVideo.dart';
import '../../dashbord/dashbordScreen/diamondDetail.dart';

class SearchResult extends StatelessWidget {
  final searchResult = Get.put(SearchResultController());
  SearchResult({super.key});
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final faechApi = searchResult.diamondSearchAPI.diamondSearchData;
      final List data = searchResult.diamondSearchAPI.diamondList;
      final totalCount = faechApi['totalCount'];
      return Fullscreen(
        appBar: allOtherScreen('Search Result (${totalCount ?? 0})'),
        child: Column(
          children: [
            if (searchResult.diamondSearchAPI.isLoading.value && data.isEmpty)
              const Expanded(child: Center(child: CircularProgressIndicator()))
            else if (data.isEmpty)
              Expanded(child: Center(child: Lottie.asset(AppJson.noData)))
            else
              Expanded(
                child: Column(
                  children: [
                    valueListDiamond(
                      valueList: data,
                      video: true,
                      camara: true,
                      isCart: true,
                      isWishlist: true,
                      scrollController: searchResult.scrollController,
                    ),
                    if (searchResult.diamondSearchAPI.isPaginationLoading.value)
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: CircularProgressIndicator(),
                      ),
                  ],
                ),
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
  ScrollController? scrollController,
}) {
  final adToCart = Get.put(CreateCartController());
  return Expanded(
    child: ListView.builder(
      controller: scrollController,
      itemCount: valueList.length,
      itemBuilder: (BuildContext context, int index) {
        return horizontalPadding(
          child: GestureDetector(
            onTap: () {
              final String id = valueList[index]['_id']?.toString() ?? '';
              final String image = valueList[index]['imageurl1']?.toString() ?? '';
              final String video = valueList[index]['videourl']?.toString() ?? '';
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
                      shape: valueList[index]['shape']?.toString() ?? '',
                      careat: valueList[index]['carat']?.toString() ?? '',
                      lab: valueList[index]['lab']?.toString() ?? '',
                      colorcode: valueList[index]['countryCode']?.toString() ?? '',
                      clarity: valueList[index]['clarity']?.toString() ?? '',
                      cartifactNo:
                          (valueList[index]['certno'] == null ||
                              valueList[index]['certno'] == '-')
                          ? ''
                          : valueList[index]['certno'].toString(),
                      cartifactIcon:
                          (valueList[index]['certno'] == null ||
                              valueList[index]['certno'] == '-')
                          ? AppIcon.user1
                          : AppIcon.diamondId,
                    ),
                    Divider(color: AppColor.gray3),
                    Row(
                      children: [
                        fristrow(
                          cps: valueList[index]['polish']?.toString() ?? '',
                          meas: valueList[index]['measurement']?.toString() ?? '',
                          refNo: valueList[index]['stockId']?.toString() ?? '',
                        ),
                        secondrow(
                          T: valueList[index]['depth']?.toString() ?? '',
                          D: valueList[index]['tablepercent']?.toString() ?? '',
                          loc: valueList[index]['country']?.toString() ?? '',
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
                          ct: valueList[index]['parcarat']?.toString() ?? '',
                          total: valueList[index]['finalamount']?.toString() ?? '',
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
    ],
  );
}
