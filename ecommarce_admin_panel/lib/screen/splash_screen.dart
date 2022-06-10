import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommarce_admin_panel/screen/login_page.dart';
import 'package:ecommarce_admin_panel/widget/spinkitWidget.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    Future.delayed(Duration(seconds: 3), () {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => LoginPage()));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow,
      body: Stack(children: [
        Center(
          child: Image.asset(
            'images/300230.png',
            height: 50,
            width: 50,
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
            top: 450,
            right: 0,
            left: 0,
            child: Center(
              child: spinkit,
            ))
      ]),
    );
  }
}
