import 'package:ecommarce_admin_panel/http/custom_http_request.dart';
import 'package:ecommarce_admin_panel/model/order_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class OrderProvider with ChangeNotifier {
  List<OrderModel> orderList = [];
  late OrderModel orderModel;

  getOrders() async {
    orderList = await CustomHttpRequest().getAllOrders();
    notifyListeners();
  }
}
