// ignore_for_file: file_names

class AppUrl {

  //base url

  //Staging
  // static const String baseUrl = "https://node.weingenious.in/classic/api/v1/";
  static const String imagebaseUrl = "https://node.weingenious.in/classic/uploads/photos/";

  //Local
  static const String baseUrl = "http://192.168.1.222:4000/api/v1/";

  static const String application = "${baseUrl}App/auth/";

  //Other
  static const String country = "${baseUrl}admin/address/getCountry";

  //credentials
  static const String login = "${application}login";
  static const String signup = "${application}signup";

  //hedder
  //cart
  static const String filterCart = "${baseUrl}App/cart/filterCart";
  static const String updateCart = "${baseUrl}App/cart/updateCart";
  static const String deleteCart ="${baseUrl}App/cart/deleteCart";

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
            static const String ringsizePrice = "${baseUrl}app/product/ringsizePrice";
            static const String createCart = "${baseUrl}App/cart/createCart";
          //Filter
            static const String getProductFilterList = "${baseUrl}App/product/getProductFilterList";
            static const String getAllParameter = "${baseUrl}admin/parameter/getAllParameter";

    //dashbord
      static const String totalRecord ="${baseUrl}App/dashboard/totalRecord";
      static const String recentView ="${baseUrl}App/dashboard/recentView";

    //diamond Sarch
      static const String filterDiamond = "${baseUrl}App/diamond/filterDiamond";
      static const String diamondDetails = "${baseUrl}App/diamond/diamondDetails";
}