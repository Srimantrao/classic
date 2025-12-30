// ignore_for_file: file_names

class AppUrl {

  //base url
  static const String baseUrl = "https://node.weingenious.in/classic/api/v1/";
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
}