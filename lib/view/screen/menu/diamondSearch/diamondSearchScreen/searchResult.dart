import 'package:classic/controller/user_Interface/menu/diamondSearch/searchResult_Controller.dart';
import 'package:classic/view/screen/hedder/drawer/drawar/drawerScreen/screen/myAccount/holdDiamods/holdDiamondWidget/body/holdDiamondWidget.dart';
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
      final faechApi = searchResult.diamondSearchAPI.diamondSearchData;
      final List data = searchResult.diamondSearchAPI.diamondList;
      final totalCount = faechApi['totalCount'];
      return Fullscreen(
        appBar: allOtherScreen('Search Result (${totalCount ?? 0})'),
        floatingActionButton: floatingActionButton(
          addHold: true,
          removeToHold: false,
          addToHoldonPress: searchResult.addHoldDiamond,
          addToWishList: searchResult.addToWishListCart,
          addToCart: searchResult.addToCart,
        ),
        child: Column(
          children: [
            if (searchResult.diamondSearchAPI.isLoading.value && data.isEmpty)
              const Expanded(child: Center(child: CircularProgressIndicator()))
            else if (data.isEmpty)
              Expanded(child: Center(child: Lottie.asset(AppJson.noData)))
            else
              Expanded(
                child: Obx(() {
                  return Column(
                    children: [
                      if (searchResult.holdDiamondList.contains(true))
                        checkvaluehedding(searchResult, data),
                      valueListDiamond(
                        valueList: data,
                        video: true,
                        camara: true,
                        isCart: true,
                        isWishlist: true,
                        holdDiamond: true,
                        scrollController: searchResult.scrollController,
                      ),
                      if (searchResult
                          .diamondSearchAPI
                          .isPaginationLoading
                          .value)
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
