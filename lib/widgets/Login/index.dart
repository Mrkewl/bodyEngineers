import 'package:body_engineer/widgets/Login/containers/emailLogin.dart';
import 'package:body_engineer/widgets/Login/containers/googleLogin.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'containers/facebookLogin.dart';
import 'package:body_engineer/widgets/HomePage/index.dart';

import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  BuildContext _mContext;

  @override
  void initState() {
    super.initState();
    //check if the user already logged in
  }

  @override
  Widget build(BuildContext ctx) {
    _mContext = ctx;
    return new Scaffold(
        appBar: null,
        backgroundColor: Colors.white,
        body: Center(
            child: SingleChildScrollView(
                child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Center(
              child: Container(
                height: MediaQuery.of(context).size.height / 3,
                padding: EdgeInsets.symmetric(vertical: 0, horizontal: 30),
                child: Image.asset(
                  'lib/assets/images/logo.png',
                ),
              ),
            ),
            Container(
              //all login buttons
              padding: EdgeInsets.symmetric(vertical: 50, horizontal: 70),
              child: Column(
                children: <Widget>[
                  facebookLogin(onSignInSuccess, onAlertCallback),
                  googleLogin(onSignInSuccess),
                  EmailLogin(),
                ],
              ),
            )
          ],
        ))));
  }

  void onSignInSuccess() {
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (BuildContext context) => HomePage()));
  }

  void onAlertCallback(message) {
    Alert(context: _mContext, title: "Error logging in. Please try again.");
  }
}
