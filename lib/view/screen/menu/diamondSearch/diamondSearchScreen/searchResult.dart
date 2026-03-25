import 'package:classic/controller/user_Interface/menu/diamondSearch/searchResult_Controller.dart';
import 'package:classic/view/screen/hedder/drawer/drawar/drawerScreen/screen/myAccount/holdDiamods/holdDiamondWidget/body/holdDiamondWidget.dart';
import 'package:classic/view/utils/app_String.dart';
import 'package:classic/view/utils/app_json.dart';
import 'package:classic/view/utils/widget/fullScreen.dart';
import 'package:classic/view/utils/widget/hadder/comanScreenHading/comanhadder.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import '../diamondWidget/body/searchResultWidget.dart';

class SearchResult extends StatelessWidget {
  final searchResult = Get.put(SearchResultController());
  SearchResult({super.key});
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final fetchApi = searchResult;
      final searchResultApi = fetchApi.diamondSearchAPI;
      final searchResultApiLoading = searchResultApi.isLoading.value;
      final paginationLoading = searchResultApi.isPaginationLoading.value;
      final searchResultData = searchResultApi.diamondSearchData;
      final List data = searchResultApi.diamondList;
      final totalCount = searchResultData['totalCount'];
      return Fullscreen(
        appBar: allOtherScreen(
          "${AppString.searchResult} (${totalCount ?? 0})",
        ),
        floatingActionButton: floatingActionButton(
          addHold: true,
          removeToHold: false,
          addToHoldonPress: fetchApi.addHoldDiamond,
          addToWishList: fetchApi.addToWishListCart,
          addToCart: fetchApi.addToCart,
        ),
        child: Column(
          children: [
            if (searchResultApiLoading && data.isEmpty)
              const Expanded(child: Center(child: CircularProgressIndicator()))
            else if (data.isEmpty)
              Expanded(child: Center(child: Lottie.asset(AppJson.noData)))
            else
              Expanded(
                child: Obx(() {
                  return Column(
                    children: [
                      if (fetchApi.holdDiamondList.contains(true))
                        checkvaluehedding(fetchApi, data),
                      valueListDiamond(
                        valueList: data,
                        video: true,
                        camara: true,
                        isCart: true,
                        isWishlist: true,
                        holdDiamond: true,
                        scrollController: fetchApi.scrollController,
                      ),
                      if (paginationLoading)
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: CircularProgressIndicator(),
                        ),
                    ],
                  );
                }),
              ),
          ],
        ),
      );
    });
  }
}
