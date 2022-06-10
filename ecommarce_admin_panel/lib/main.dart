import 'package:ecommarce_admin_panel/provider/categoryProvider.dart';
import 'package:ecommarce_admin_panel/provider/order_provider.dart';
import 'package:ecommarce_admin_panel/provider/product_provider.dart';
import 'package:ecommarce_admin_panel/screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider<OrderProvider>(create: (_) => OrderProvider()),
    ChangeNotifierProvider<CategoryProvider>(create: (_) => CategoryProvider()),
    ChangeNotifierProvider<ProductProvider>(create: (_) => ProductProvider()),
  ], child: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
