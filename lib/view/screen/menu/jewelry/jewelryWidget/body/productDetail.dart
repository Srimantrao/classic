// ignore_for_file: file_names, strict_top_level_inference

import 'package:classic/view/utils/app_Color.dart';
import 'package:classic/view/utils/app_String.dart';
import 'package:classic/view/utils/app_TextSize.dart';
import 'package:classic/view/utils/widget/cartcontainer.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import '../../../../../../controller/user_Interface/menu/jewelry/productDetailUI_Controller.dart';
import '../../../../../../modal/menu/diamondSearch/diamondSearch.dart';
import '../../../../../../modal/menu/jewelry/productDetail.dart';
import '../../../../../utils/app_Borderradius.dart';
import '../../../../../utils/widget/horizontalpaddind.dart';
import '../../../../../utils/widget/inputfield.dart';
import '../../jewelryExtraWidget/productDetail.dart';

//Product Image
Widget productDetailImage(image) {
  return Column(
    children: [
      Container(
        decoration: BoxDecoration(
          border: Border.all(color: AppColor.gray3, width: 2),
          color: AppColor.gray,
        ),
        child: Image(image: AssetImage(image)),
      ),
      SizedBox(height: Get.height * 0.015),
      horizontalPadding(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            showItemImage(image),
            showItemImage(image),
            showItemImage(image),
            showItemImage(image),
          ],
        ),
      ),
      SizedBox(height: Get.height * 0.015),
    ],
  );
}

//Product Price
Widget productDetailsPrice(name, price) {
  return horizontalPadding(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          name,
          style: TextStyle(
            fontSize: Textsize.samiHedding,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: Get.height * 0.003),
        Text(
          'SKU : SJBR20352-0.75CT-S-14W',
          style: TextStyle(
            fontSize: Get.width * 0.03,
            fontWeight: FontWeight.w500,
            color: AppColor.gray3,
          ),
        ),
        SizedBox(height: Get.height * 0.003),
        Row(
          children: [
            Text(
              price,
              style: TextStyle(
                fontSize: Get.width * 0.04,
                fontWeight: FontWeight.w500,
                color: AppColor.primary,
              ),
            ),
            SizedBox(width: Get.width * 0.015),
            Text(
              '(Inclusive Of All Taxes)',
              style: TextStyle(
                fontSize: Get.width * 0.04,
                fontWeight: FontWeight.w500,
                color: AppColor.gray3,
              ),
            ),
          ],
        ),
      ],
    ),
  );
}

Widget productShape() {
  final diamondList = DiamondList();
  return horizontalPadding(
    child: Column(
      children: [
        SizedBox(height: Get.height * 0.02),
        SizedBox(
          height: Get.height * 0.04,
          child: Row(
            children: [
              productDetailsubHedding('Shape :- '),
              GetBuilder<ProductdetailuiController>(
                builder: (controller) {
                  return Expanded(
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: diamondList.shapes.length,
                      itemBuilder: (context, index) {
                        final shape = diamondList.shapes[index];
                        final isSelected = controller.selectShape == shape;
                        return sahapeContainer(
                          shape: shape,
                          isSelected: isSelected,
                          onTap: () => controller.selectDiamondShape(shape),
                        );
                      },
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

//Product Stamp
Widget productStamp(productdetail) {
  return horizontalPadding(
    child: Column(
      children: [
        SizedBox(height: Get.height * 0.02),
        Row(
          children: [
            productDetailsubHedding('Metal Stamp :- '),
            SizedBox(width: Get.width * 0.03),
            caratButton(
              '10 K',
              isSelectcarat: productdetail.isSelectcarat_10K.value,
              onTap: productdetail.selectcarat_10K,
            ),
            caratButton(
              '14 K',
              isSelectcarat: productdetail.isSelectcarat_14K.value,
              onTap: productdetail.selectcarat_14K,
            ),
            caratButton(
              '18 K',
              isSelectcarat: productdetail.isSelectcarat_18K.value,
              onTap: productdetail.selectcarat_18K,
            ),
          ],
        ),
      ],
    ),
  );
}

//Product Metal Type
Widget productmetalType(productdetail) {
  return horizontalPadding(
    child: Column(
      children: [
        SizedBox(height: Get.height * 0.02),
        Row(
          children: [
            productDetailsubHedding('Metal Type :- '),
            SizedBox(width: Get.width * 0.03),
            metaltypeselect(
              AppColor.gray3,
              isSelectmetaltype: productdetail.isSelectWitheGold.value,
              onTap: productdetail.selectWitheGold,
            ),
            metaltypeselect(
              AppColor.roseGold,
              isSelectmetaltype: productdetail.isSelectRoseGold.value,
              onTap: productdetail.selectRoseGold,
            ),
            metaltypeselect(
              AppColor.complete,
              isSelectmetaltype: productdetail.isSelectYellowGold.value,
              onTap: productdetail.selectYellowGold,
            ),
          ],
        ),
      ],
    ),
  );
}

//Product Carat
Widget selectCarat(productdetail) {
  return horizontalPadding(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: Get.height * 0.02),
        Row(
          children: [
            productDetailsubHedding('Carat :- '),
            caratButton(
              '0.75',
              isSelectcarat: productdetail.selectcarat_75.value,
              onTap: productdetail.select_75,
            ),
            caratButton(
              '1',
              isSelectcarat: productdetail.selectcarat_1.value,
              onTap: productdetail.select_1,
            ),
          ],
        ),
      ],
    ),
  );
}

//Product Remark
Widget productDetailsRemark(TextEditingController? controller) {
  return horizontalPadding(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(height: Get.height * 0.02),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            productDetailsubHedding('Remark :- '),
            Expanded(
              child: Inputfield(
                controller: controller,
                color: AppColor.gray5,
                height: Get.height * 0.09,
                hinttext: AppString.enterRemark,
                hintStyle: TextStyle(fontFamily: 'FuturaCyrillic'),
              ),
            ),
          ],
        ),
      ],
    ),
  );
}

//Bracelet Size
Widget braceletSize(productdetail) {
  return horizontalPadding(
    child: Row(
      children: [
        productDetailsubHedding('Bracelet Size :- '),
        Container(
          decoration: BoxDecoration(border: Border.all(color: AppColor.gray3)),
          child: DropdownButtonHideUnderline(
            child: DropdownButton2<String>(
              iconStyleData: IconStyleData(
                icon: Icon(Icons.keyboard_arrow_down_rounded),
                iconSize: 22,
              ),
              buttonStyleData: ButtonStyleData(
                padding: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(borderradius.buttonboder),
                ),
              ),
              dropdownStyleData: DropdownStyleData(
                maxHeight: 100,
                width: 110,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(borderradius.buttonboder),
                ),
              ),
              hint: Text(
                'Select Size',
                style: TextStyle(fontSize: Get.height * 0.015),
              ),
              value: productdetail.selectedBraceletSize.value,
              items: ProductDetailList().braceletSizes
                  .map(
                    (size) => DropdownMenuItem<String>(
                      value: size,
                      child: Text(size),
                    ),
                  )
                  .toList(),
              onChanged: (value) {
                productdetail.selectedBraceletSize.value = value!;
              },
            ),
          ),
        ),
      ],
    ),
  );
}

Widget engraving(productdetail, controller) {
  return horizontalPadding(
    child: Column(
      children: [
        SizedBox(height: Get.height * 0.02),
        Row(
          children: [
            productDetailsubHedding('Engriving :- '),
            Expanded(
              child: Inputfield(
                controller: controller,
                color: AppColor.gray5,
                height: Get.height * 0.05,
                hinttext: AppString.enterRemark,
                hintStyle: TextStyle(fontFamily: 'FuturaCyrillic'),
              ),
            ),
          ],
        ),
      ],
    ),
  );
}

//Qty
Widget quantity({
  void Function()? onTapIncrimant,
  void Function()? onTapDecrimant,
  int? value,
}) {
  return horizontalPadding(
    child: Column(
      children: [
        Row(
          children: [
            productDetailsubHedding('Qty:- '),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: AppColor.gray5),
                borderRadius: BorderRadius.circular(borderradius.buttonboder),
              ),
              child: Row(
                children: [
                  changvalue('-', onTap: onTapDecrimant),
                  editValue(value.toString()),
                  changvalue('+', onTap: onTapIncrimant),
                ],
              ),
            ),
          ],
        ),
      ],
    ),
  );
}

Widget productmetalDetails({
  String? productCodeValue,
  String? metalValue,
  String? heightValue,
  String? widthValue,
  String? productWeightValue,
  String? color,
  String? clarity,
  String? shape,
  String? wgt,
  String? pieces,
  void Function()? onTapMetal,
  void Function()? onTapStone,
  bool metalDetail = false,
  bool stoneDetail = false,
}) {
  return horizontalPadding(
    child: Column(
      children: [
        SizedBox(height: Get.height * 0.02),
        cartConatiner(
          child: Column(
            children: [
              GestureDetector(
                onTap: onTapMetal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    metalHedding('Product And Metal Details'),
                    (metalDetail) ? toggleIcon('-') : toggleIcon('+'),
                  ],
                ),
              ),
              Divider(color: AppColor.editColor),
              SizedBox(height: Get.height * 0.01),
              (metalDetail)
                  ? Column(
                      children: [
                        metalDetailPadding(
                          title: 'Product Code :- ',
                          value: productCodeValue,
                        ),
                        metalDetailPadding(
                          title: 'Metal :- ',
                          value: metalValue,
                        ),
                        metalDetailPadding(
                          title: 'Height :- ',
                          value: heightValue,
                        ),
                        metalDetailPadding(
                          title: 'Width :- ',
                          value: widthValue,
                        ),
                        metalDetailPadding(
                          title: 'Product Weight (Approximate) :- ',
                          value: productWeightValue,
                        ),
                      ],
                    )
                  : SizedBox(),
              GestureDetector(
                onTap: onTapStone,
                child: Column(
                  children: [
                    (metalDetail)
                        ? SizedBox(height: Get.height * 0.02)
                        : SizedBox(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        metalHedding('Ceter Stone Details'),
                        (stoneDetail) ? toggleIcon('-') : toggleIcon('+'),
                      ],
                    ),
                    Divider(color: AppColor.editColor),
                    SizedBox(height: Get.height * 0.01),
                    (stoneDetail)
                        ? Column(
                            children: [
                              metalDetailPadding(
                                title: 'Color :- ',
                                value: color,
                              ),
                              metalDetailPadding(
                                title: 'Clarity :- ',
                                value: clarity,
                              ),
                              metalDetailPadding(
                                title: 'Shape :- ',
                                value: shape,
                              ),
                              metalDetailPadding(title: 'Wgt :- ', value: wgt),
                              metalDetailPadding(
                                title: 'Pieces :- ',
                                value: pieces,
                              ),
                            ],
                          )
                        : SizedBox(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

//Like
Widget listLike({required List product}) {
  return Column(
    children: [
      SizedBox(height: Get.height * 0.02),
      Text(
        'You May Also Like',
        style: TextStyle(
          fontSize: Get.width * 0.047,
          fontWeight: FontWeight.w500,
          color: AppColor.primary,
        ),
      ),
      SizedBox(height: Get.height * 0.009),
      SizedBox(
        height: Get.height * 0.25,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: product.length,
          padding: EdgeInsets.zero,
          itemBuilder: (context, index) {
            return like(
              image: product[index]['image'],
              name: product[index]['name'],
              price: product[index]['price'],
            );
          },
        ),
      ),
    ],
  );
}
