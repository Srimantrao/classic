// ignore_for_file: file_names

class AppUrl {

  //base url
  static const String baseUrl = "https://node.weingenious.in/classic/api/v1/";
  static const String imagebaseUrl = "https://node.weingenious.in/classic/uploads/photos/";
  static const String application = "${baseUrl}App/auth/";

  //Other
  static const String country = "${baseUrl}admin/address/getCountry";

  //credentials
  static const String login = "${application}login";
  static const String signup = "${application}signup";

  //Menu
    //home
      static const String filterSlider = "${baseUrl}App/slider/filterSlider/1";
      static const String homeCollection = "${baseUrl}App/homecollection/getCategoryHomeCollection";

    //jewelry
      //Catagory
      static const String category = "${baseUrl}App/category/getCategory";
        //Product List
        static const String productList = "${baseUrl}App/product/getProductList";
          //Product Detail
            static const String productDetail = "${baseUrl}App/product/productDetails";
            static const String youmayLike = "${baseUrl}App/product/youMayAlsoLike";
            static const String braceletPrice = "${baseUrl}App/product/braceletPrice";

          //Filter
            static const String getProductFilterList = "${baseUrl}App/product/getProductFilterList";
            static const String getAllParameter = "${baseUrl}admin/parameter/getAllParameter";

}