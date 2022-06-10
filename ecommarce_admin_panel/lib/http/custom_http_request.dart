import 'dart:convert';

import 'package:ecommarce_admin_panel/model/category_model.dart';
import 'package:ecommarce_admin_panel/model/order_model.dart';
import 'package:ecommarce_admin_panel/model/product_model.dart';
import 'package:ecommarce_admin_panel/widget/widget.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class CustomHttpRequest {
  static const Map<String, String> defaultHeader = {
    "Accept": "application/json",
    "Authorization":
        "bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczpcL1wvYXBpaG9tZWNoZWYuYW50b3BvbGlzLnh5elwvYXBpXC9hZG1pblwvc2lnbi1pbiIsImlhdCI6MTY1NDAwNzYwNiwiZXhwIjoxNjY2OTY3NjA2LCJuYmYiOjE2NTQwMDc2MDYsImp0aSI6IjlLWGFGNmRFdlgwWVNZVzIiLCJzdWIiOjUwLCJwcnYiOiIyM2JkNWM4OTQ5ZjYwMGFkYjM5ZTcwMWM0MDA4NzJkYjdhNTk3NmY3In0.Cbii274lgjkMIf2Ix9fZ7e8HPAT47B5MV0QP03Rd520",
  };

  SharedPreferences? sharedPreferences;

  Future<Map<String, String>> getHeaderWithToken() async {
    sharedPreferences = await SharedPreferences.getInstance();
    var header = {
      "Accept": "application/json",
      "Authorization": "bearer  ${sharedPreferences!.getString("token")}",
    };
    print("token is ${sharedPreferences!.getString("token")}");
    return header;
  }

  String allOrderLink =
      "https://apihomechef.antopolis.xyz/api/admin/all/orders";

  Future<dynamic> getAllOrders() async {
    List<OrderModel> orderList = [];
    late OrderModel orderModel;
    var responce = await http.get(Uri.parse(allOrderLink),
        headers: await CustomHttpRequest().getHeaderWithToken());
    if (responce.statusCode == 200) {
      var item = jsonDecode(responce.body);
      print("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa$item");
      for (var data in item) {
        orderModel = OrderModel.fromJson(data);

        orderList.add(orderModel);
      }
      print("total order is ${orderList.length}");
    }

    return orderList;
  }

  Future<dynamic> getAllCategory() async {
    List<CategoryModel> categoryList = [];
    late CategoryModel categoryModel;
    var responce = await http.get(
        Uri.parse("https://apihomechef.antopolis.xyz/api/admin/category"),
        headers: await CustomHttpRequest().getHeaderWithToken());
    if (responce.statusCode == 200) {
      var item = jsonDecode(responce.body);
      print("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa$item");
      for (var data in item) {
        categoryModel = CategoryModel.fromJson(data);

        categoryList.add(categoryModel);
      }
      print("total order is ${categoryList.length}");
    }

    return categoryList;
  }

  static Future<dynamic> deleteCategory(int id) async {
    var responce = await http.delete(
        Uri.parse(
            "https://apihomechef.antopolis.xyz/api/admin/category/$id/delete"),
        headers: await CustomHttpRequest().getHeaderWithToken());

    if (responce.statusCode == 200) {
      showInToast("Category Item Deleted Successfully");
    } else {
      showInToast("PLs try again");
    }
  }

  Future<dynamic> getAllproducts() async {
    List<ProductModel> productList = [];
    late ProductModel productModel;
    var responce = await http.get(
        Uri.parse("https://apihomechef.antopolis.xyz/api/admin/products"),
        headers: await CustomHttpRequest().getHeaderWithToken());
    if (responce.statusCode == 200) {
      var item = jsonDecode(responce.body);
      print("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa$item");
      for (var data in item) {
        productModel = ProductModel.fromJson(data);

        productList.add(productModel);
      }
      print("total order is ${productList.length}");
    }

    return productList;
  }

  static Future<dynamic> deleteProduct(int id) async {
    var responce = await http.delete(
        Uri.parse(
            "https://apihomechef.antopolis.xyz/api/admin/products/$id/delete"),
        headers: await CustomHttpRequest().getHeaderWithToken());

    if (responce.statusCode == 200) {
      showInToast("Producr Item Deleted Successfully");
    } else {
      showInToast("PLs try again");
    }
  }
}
