import 'dart:convert';

import 'package:ecommarce_admin_panel/provider/order_provider.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // TODO: implement initState

    // getAllOrders();
    Provider.of<OrderProvider>(context, listen: false).getOrders();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final orderList = Provider.of<OrderProvider>(context).orderList;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: orderList.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 150,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                        color: Colors.yellow,
                        width: 2,
                        style: BorderStyle.solid)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "Name: ${orderList[index].user!.name}",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blue,
                                    fontSize: 15),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Price: ${orderList[index].price}"),
                              Text("Quantity: ${orderList[index].quantity}"),
                              Text("Discount: ${orderList[index].discount}"),
                              Text("Vat: ${orderList[index].vat}"),
                              Text("Payment: ${orderList[index].payment}"),
                            ],
                          )
                        ],
                      ),
                      Text(
                        "Order Status: ${orderList[index].orderStatus!.orderStatusCategory!.name}",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.red),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
