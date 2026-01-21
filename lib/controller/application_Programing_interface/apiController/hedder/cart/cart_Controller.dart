import 'package:classic/controller/application_Programing_interface/apiService/hedder/cart/cartService.dart';
import 'package:classic/view/utils/api_Message.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  final cartService = CartService();
  var isLoading = false.obs;
  var cartData = {}.obs;

  Future<void> filterCart() async {
    try {
      isLoading.value = true;
      final response = await cartService.filterCartService();
      if (response.statusCode == 200 || response.statusCode == 201) {
        successMesssess(
          response: response,
          data: cartData,
          callAPI: 'cartData',
        );
      } else {
        throw Exception('Failed to fetch cart data');
      }
    } on DioException catch (e) {
      errorMesssess(e: e, callAPI: 'cartData');
    } finally {
      isLoading.value = false;
    }
  }
}
