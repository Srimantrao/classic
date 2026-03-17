// ignore_for_file: file_names

class AppUrl {

  //base url

  //Staging
  static const String baseUrl = "https://node.weingenious.in/classic/api/v1/";
  static const String imagebaseUrl = "https://node.weingenious.in/classic/uploads/photos/";

  //Local
  // static const String baseUrl = "http://192.168.1.222:4000/api/v1/";

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
    //drawer
      static const String showList = "${baseUrl}app/shows/list";
          //myAccount
              //profile
                static const String profile = "${baseUrl}App/myaccount/profileDetail";
                static const String editProfile = "${baseUrl}App/myaccount/updateProfile";
              //order History
                static const String orderHistory = "${baseUrl}App/myaccount/orderList";
                static const String orderDetail = "${baseUrl}App/myaccount/orderDetail";
              //wishlist
                static const String filterWish = "${baseUrl}App/wishlist/filteraWishList";
              //hold Diamond
                static const String getHoldDiamond = "${baseUrl}App/hold/getallHold";
                static const String removeholdDiamond = "${baseUrl}App/hold/removeFromhold";
              //CustomProduct
                static const String customProduct = "${baseUrl}App/customProduct/getCustomProductList";
                static const String detailCustomProduct = "${baseUrl}app/customProduct/getCustomProductDetails";
              //Address
                static const String getAddress = "${baseUrl}App/order/customerAddress";
                static const String addAddress = "${baseUrl}App/myaccount/addMyAddress";
                static const String removeAddress = "${baseUrl}app/myaccount/deleteMyAddress";
                static const String editAddress = "${baseUrl}App/myaccount/editMyAddress";
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
            static const String createWishlist = "${baseUrl}App/wishlist/createWishlist";

          //Filter
            static const String getProductFilterList = "${baseUrl}App/product/getProductFilterList";
            static const String getAllParameter = "${baseUrl}admin/parameter/getAllParameter";

    //dashbord
      static const String totalRecord ="${baseUrl}App/dashboard/totalRecord";
      static const String recentView ="${baseUrl}App/dashboard/recentView";

    //diamond Sarch
      static const String filterDiamond = "${baseUrl}App/diamond/filterDiamond";
      static const String diamondDetails = "${baseUrl}App/diamond/diamondDetails";
      static const String wishListDelet = "${baseUrl}App/wishlist/deleteWishList";
      static const String holdDiamond = "${baseUrl}App/diamond/addTohold";

    //add Custom Jewellery
      static const String addCustomJewellery = "${baseUrl}App/customProduct/createCustomProduct";
      static const String getAllStoneGroupList = "${baseUrl}admin/product/getAllStoneGroupList";
}