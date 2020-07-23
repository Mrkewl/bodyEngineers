import 'dart:async';

import 'package:body_engineer/widgets/HomePage/index.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 2),
        () => Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (BuildContext context) => HomePage())));
  }

  @override
  Widget build(BuildContext ctx) {
    return new Scaffold(
      appBar: null,
      backgroundColor: Colors.blue,
      //body: Center(child: Image.asset('asset/logo.png')),
    );
  }
}
