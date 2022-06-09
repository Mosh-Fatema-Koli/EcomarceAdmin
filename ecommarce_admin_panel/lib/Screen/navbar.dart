import 'dart:io';

import 'package:ecommarce_admin_panel/Screen/category_page.dart';
import 'package:ecommarce_admin_panel/Screen/home.dart';
import 'package:ecommarce_admin_panel/Screen/order_pase.dart';
import 'package:ecommarce_admin_panel/Screen/product_page.dart';
import 'package:ecommarce_admin_panel/Screen/profile.dart';
import 'package:ecommarce_admin_panel/widget/brand_colors.dart';
import 'package:flutter/material.dart';

class NabBarPage extends StatefulWidget {
  const NabBarPage({Key? key}) : super(key: key);

  @override
  State<NabBarPage> createState() => _NabBarPageState();
}

class _NabBarPageState extends State<NabBarPage> {
  int currentIndex = 0;

  List<Widget> pages = [
    HomePage(),
    CategoryPage(),
    ProductPage(),
    OrderPage(),
    ProfilePage()
  ];

  onBackPressed() {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(13.0)),
            title: Text(
              "Are You Sure ?",
              style: myStyle(16, Colors.white, FontWeight.w500),
            ),
            content: Text("You are going to exit the app !"),
            titlePadding:
                EdgeInsets.only(top: 30, bottom: 12, right: 30, left: 30),
            contentPadding: EdgeInsets.only(
              left: 30,
              right: 30,
            ),
            backgroundColor: Color.fromARGB(255, 6, 22, 238),
            contentTextStyle: myStyle(
                14, BrandColors.colorText.withOpacity(0.7), FontWeight.w400),
            titleTextStyle: myStyle(18, Colors.white, FontWeight.w500),
            actionsPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 12),
            actions: <Widget>[
              MaterialButton(
                  onPressed: () {
                    Navigator.of(context).pop(false);
                  },
                  child: Text(
                    "No",
                    style: myStyle(14, BrandColors.colorText),
                  )),
              MaterialButton(
                padding: EdgeInsets.symmetric(vertical: 16, horizontal: 22),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0)),
                color: BrandColors.colorPurple,
                child: Text(
                  'Yes',
                  style: myStyle(14, Colors.white, FontWeight.w500),
                ),
                onPressed: () {
                  exit(0);
                },
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.menu,
            color: Colors.black87,
          ),
        ),
        actions: [
          Icon(
            Icons.camera_alt_outlined,
            color: Colors.black87,
          ),
          SizedBox(
            width: 12,
          )
        ],
      ),
      body: WillPopScope(
        onWillPop: () async {
          return onBackPressed();
        },
        child: Container(child: pages[currentIndex]),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.blueGrey,
        showUnselectedLabels: true,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: "Category",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: "Products",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.production_quantity_limits_rounded),
            label: "Orders",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.support),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}
