import 'dart:async';
import 'package:flutter/material.dart';
import 'package:sample/ecommerce/Homepage.dart';
import 'package:sample/ecommerce/Loginpage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  String username = "";
  String password = "";

  @override
  void initState() {
    Timer(Duration(seconds: 1), () async {
      SharedPreferences pref = await SharedPreferences.getInstance();
      username = pref.getString('username');
      password = pref.getString('password');
      if (username == null && password == null) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => LoginPage()));
      } else {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Homepage()));
      }
    });
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
          child: Image.asset(
        'Images/H_M_Online_1 (1).jpg',
        width: 200,
      )),
    );
  }
}
