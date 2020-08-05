import 'package:body_engineer/widgets/Login/authService.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:flutter_icons/flutter_icons.dart';

final facebookLogin = (onSignInSuccess, onAlertCallback) => RaisedButton(
    onPressed: () =>
        AuthService().initiateFacebookLogin(onSignInSuccess, onAlertCallback),
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18.0),
        side: BorderSide(color: Colors.blue[900])),
    color: Colors.blue[900],
    elevation: 10,
    child: Row(
      children: <Widget>[
        Container(
          padding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
          child: Icon(
            AntDesign.facebook_square,
            color: Colors.white,
          ),
        ),
        Text(
          "Sign in with Facebook",
          style: TextStyle(color: Colors.white),
        ),
      ],
    ));
