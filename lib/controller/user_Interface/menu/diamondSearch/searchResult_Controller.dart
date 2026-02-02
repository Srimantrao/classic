import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../../application_Programing_interface/apiController/menu/diamondSearch/diamondSearch_Controller.dart';

class SearchResultController extends GetxController {
  final diamondSearchAPI = Get.find<DiamondSearchController>();
  final ScrollController scrollController = ScrollController();

  @override
  void onInit() {
    super.onInit();
    scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    if (scrollController.position.pixels >=
        scrollController.position.maxScrollExtent - 200) {
      if (!diamondSearchAPI.isPaginationLoading.value &&
          diamondSearchAPI.diamondList.length <
              (diamondSearchAPI.diamondSearchData['totalCount'] ?? 0)) {
        diamondSearchAPI.currentPage++;
        diamondSearchAPI.diamondSearching(
          pageSize: diamondSearchAPI.pageSize.toString(),
          pageNumber: diamondSearchAPI.currentPage.toString(),
          isPagination: true,
        );
      }
    }
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }
}
