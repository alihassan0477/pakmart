import 'package:pakmart/service/session_manager/session_controller.dart';

class AppUrl {
  static const String baseApi = "http://localhost:2000";

  static const FETCH_CATEGORIES = "$baseApi/api/get-categories";

  static const CREATE_PRODUCT = "$baseApi/api/create-product";

  static String getSellerIdUrl(String sellerId) {
    return "$baseApi/get-products-by-sellerId/$sellerId";
  }

  static String productDeleteUrl(String productId, String sellerId) {
    return "$baseApi/api/product/676df47ff2bde30114de4bfb?sellerId=$sellerId";
  }
}
