import 'dart:convert';

import 'package:ecommarce_admin_panel/Auth/register.dart';
import 'package:ecommarce_admin_panel/Screen/navbar.dart';
import 'package:ecommarce_admin_panel/widget/custom_TextField.dart';
import 'package:ecommarce_admin_panel/widget/widget.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _emailcontroller = TextEditingController();
  TextEditingController _Passwordcontroller = TextEditingController();
  bool isLoading = false;
  SharedPreferences? sharedPreferences;
  String? token;
  String loginLlink = "https://apihomechef.antopolis.xyz/api/admin/sign-in";

  isLogin() async {
    sharedPreferences = await SharedPreferences.getInstance();
    token = sharedPreferences!.getString("token");
    if (token!.isNotEmpty) {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => NabBarPage()));
    } else {
      print("token is null");
    }
  }

  getLogin() async {
    sharedPreferences = await SharedPreferences.getInstance();
    var map = Map<String, dynamic>();
    map["email"] = _emailcontroller.text.toString();
    map["password"] = _Passwordcontroller.text.toString();
    var responce = await http.post(
      Uri.parse(loginLlink),
      body: map,
    );
    final data = jsonDecode(responce.body);
    print("hhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh$data");
    if (responce.statusCode == 200) {
      setState(() {
        sharedPreferences!.setString("token", data["access_token"]);
      });
      token = sharedPreferences!.getString("token");
      print("Token Saved $token");
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => NabBarPage()));
      showInToast("Login Succesfull");
    } else {
      showInToast("Login Failed");
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    isLogin();
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        leading: Icon(
          Icons.arrow_back_ios,
          color: Colors.black,
        ),
        title: Text(
          "Sign In",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Container(
        margin: EdgeInsets.only(
          left: 40,
          right: 40,
          top: 80,
        ),
        decoration: BoxDecoration(
            color: Colors.yellow, borderRadius: BorderRadius.circular(20)),
        height: 400,
        child: Padding(
          padding: const EdgeInsets.all(50),
          child: Column(
            children: [
              Text(
                " Admin Log In",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 25,
              ),
              CustomTextField(
                controller: _emailcontroller,
                hintText: "Enter your Email",
              ),
              CustomTextField(
                controller: _Passwordcontroller,
                hintText: "Enter your password",
              ),
              SizedBox(
                height: 15,
              ),
              ElevatedButton(
                onPressed: () {
                  getLogin();
                },
                child: Text("Log In"),
              ),
              SizedBox(
                height: 5,
              ),
              Text("Or"),
              SizedBox(
                height: 5,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => RegisterPage()));
                },
                child: Text(
                  "Register",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
