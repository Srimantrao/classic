
import 'package:classic/view/screen/menu/jewelry/jewelryScreen/filter.dart';
import 'package:classic/view/screen/menu/jewelry/jewelryWidget/body/productbody.dart';
import 'package:classic/view/utils/app_Color.dart';
import 'package:classic/view/utils/app_URL.dart';
import 'package:classic/view/utils/widget/fullScreen.dart';
import 'package:classic/view/utils/widget/hadder/comanScreenHading/comanhadder.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import '../../../../utils/app_String.dart';
import '../../../../utils/widget/horizontalpaddind.dart';
import '../jewelryExtraWidget/product.dart';

class Product extends StatelessWidget {
  final List<Map<String, dynamic>> subCategories;
  const Product({super.key, required this.subCategories});
  @override
  Widget build(BuildContext context) {
    final searchController = TextEditingController();
    return Fullscreen(
      appBar: allOtherScreen(AppString.product, cart: true),
      child: Column(
        children: [
          search(searchController, filtertab: () => Get.to(() => Filter())),
          Expanded(
            child: horizontalPadding(
              child: GridView.builder(
                itemCount: subCategories.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: Get.width * 0.04,
                  mainAxisSpacing: Get.width * 0.04,
                  mainAxisExtent: 300,
                ),
                itemBuilder: (_, i) {
                  final item = subCategories[i];
                  return Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColor.gray),
                    ),
                    child: Column(
                      children: [
                        Image(image: NetworkImage(AppUrl.imagebaseUrl + item['image'])),
                        Text(item['slug'] ?? ''),
                        productName('jj'),
                        price('jj'),
                        SizedBox(height: Get.height * 0.01),
                        Row(
                          children: [
                            information('Metal'),
                            Expanded(
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: caratInformation(),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: Get.height * 0.01),
                        Row(children: [information('Carat'), caratHowMany('1')]),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
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
