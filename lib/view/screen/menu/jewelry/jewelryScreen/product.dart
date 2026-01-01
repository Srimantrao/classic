import 'package:classic/controller/application_Programing_interface/apiController/menu/jewellery/productList_Controller.dart';
import 'package:classic/view/screen/menu/jewelry/jewelryScreen/filter.dart';
import 'package:classic/view/screen/menu/jewelry/jewelryWidget/body/productbody.dart';
import 'package:classic/view/utils/app_Color.dart';
import 'package:classic/view/utils/widget/fullScreen.dart';
import 'package:classic/view/utils/widget/hadder/comanScreenHading/comanhadder.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import '../../../../utils/app_String.dart';
import '../../../../utils/app_URL.dart';
import '../../../../utils/widget/horizontalpaddind.dart';
import '../jewelryExtraWidget/product.dart';
import '../jewelryWidget/body/productbody.dart';

class Product extends StatelessWidget {
  final productListAPI = Get.put(ProductlistController());
  final String categoryId;
  final String categoryName;
  final String? subCategoryId;
  final String? metalType;
  final String? metalStamp;
  final String? shape;
  final String? settingType;
  final String? minPrice;
  final String? priceShort;

  Product({
    super.key,
    required this.categoryId,
    required this.categoryName,
    this.subCategoryId,
    this.metalType,
    this.metalStamp,
    this.shape,
    this.settingType,
    this.minPrice,
    this.priceShort,
  });

  @override
  Widget build(BuildContext context) {
    productListAPI.productList(categoryId: categoryId);
    final searchController = TextEditingController();
    return Fullscreen(
      appBar: allOtherScreen(categoryName.toUpperCase(), cart: true),
      child: Column(
        children: [
          search(searchController, filtertab: () => Get.to(() => Filter())),
          Obx(() {
            final loading = productListAPI.isLoading.value;
            final product = productListAPI.productListData;
            final prdoductList = product['data'];
            // 1️⃣ Loading state
            if (loading) {
              return const Center(child: CircularProgressIndicator());
            }

            // 2️⃣ Empty data state
            if (product.isEmpty ||
                prdoductList == null ||
                prdoductList.isEmpty) {
              return const Center(child: Text('No products found'));
            }

            // 3️⃣ Success state
            return Expanded(
              child: horizontalPadding(
                child: GridView.builder(
                  itemCount: prdoductList.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: Get.width * 0.04,
                    mainAxisSpacing: Get.width * 0.04,
                    mainAxisExtent: 300,
                  ),
                  itemBuilder: (BuildContext context, int index) {

                    final product = prdoductList[index];
                    final List childProducts = product['childProduct'] ?? [];
                    if (childProducts.isEmpty) SizedBox();
                    final item = childProducts.first;
                    final images = item['images'] ?? [];

                    return Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColor.gray),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.network(
                              images != null && images.isNotEmpty
                                  ? images.first['zoom']
                                  : '',
                              fit: BoxFit.cover,
                              errorBuilder: (_, __, ___) => const SizedBox(
                                height: 120,
                                child: Center(child: Text('No Image')),
                              ),
                            ),
                            productName(
                              item['productTitle'] != null &&
                                      item['productTitle'].toString().length >
                                          35
                                  ? '${item['productTitle'].toString().substring(0, 35)}....'
                                  : item['productTitle']?.toString() ?? '',
                            ),
                            price(
                              (double.tryParse('${item['finalPrice']}') ?? 0).toStringAsFixed(2),
                            ),
                            SizedBox(height: Get.height * 0.01),
                            // Row(
                            //   children: [
                            //     Text('Metal :-'),
                            //     Container(
                            //       decoration: BoxDecoration(
                            //         border: Border.all(
                            //           color: AppColor.gray5,
                            //         )
                            //       ),
                            //       child: Text(item['metalStamp'][index]['paraMtrName']),
                            //     ),
                            //   ],
                            // ),
                            SizedBox(height: Get.height * 0.01),
                            Row(
                              children: [
                                information('Carat'),
                                caratHowMany('1'),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            );
          }),
        ],
      ),
    );
  }
}

// class Product extends StatelessWidget {
//   final jewellry = Get.put(JewelleryAPICall());
//   final List categoryId;
//   Product({super.key, required this.categoryId});
//   @override
//   Widget build(BuildContext context) {
//     final listItem = jewellry.categoryAPI.catagoryData['data'];
//     final searchController = TextEditingController();
//     return Fullscreen(
//       appBar: allOtherScreen(AppString.product, cart: true),
//       child: Column(
//         children: [
//           search(searchController, filtertab: () => Get.to(() => Filter())),
//       Expanded(
//         child: horizontalPadding(
//           child: GridView.builder(
//             itemCount: categoryId['subCategory'].length,
//             gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//               crossAxisCount: 2,
//               crossAxisSpacing: Get.width * 0.04,
//               mainAxisSpacing: Get.width * 0.04,
//               mainAxisExtent: 300,
//             ),
//             itemBuilder: (context, index) {
//               final item = categoryId[''][index];
// print(categoryId[index]['subCategory'][index]['slug']);
//               return Container(
//                 // child: Image.network(categoryId[index]['image']),
//               );
//             },
//           ),
//         ),
//       )],
//       ),
//     );
//   }
// }

// productList(
//   list: listItem['subCategory'],
//   onTapImagePath: (image) {
//     Get.to(() => ProductImage(image: image));
//   },
//   onTapProductDetail: (image, name, price) {
//     Get.to(
//           () => ProductDetail(image: image, name: name, price: price),
//     );
//   },
// ),
