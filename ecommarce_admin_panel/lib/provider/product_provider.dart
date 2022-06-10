import 'package:ecommarce_admin_panel/http/custom_http_request.dart';
import 'package:ecommarce_admin_panel/model/product_model.dart';
import 'package:flutter/cupertino.dart';

class ProductProvider with ChangeNotifier {
  List<ProductModel> productList = [];
  late ProductModel productModel;

  getProducts() async {
    productList = await CustomHttpRequest().getAllproducts();
    notifyListeners();
  }
}
