import 'package:body_engineer/widgets/Login/authService.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

final googleLogin = (onSignInSuccess) => RaisedButton(
    onPressed: () => AuthService().initiateGoogleLogin(onSignInSuccess),
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18.0),
        side: BorderSide(color: Colors.black)),
    color: Colors.white,
    elevation: 10,
    child: Row(
      children: <Widget>[
        Container(
          padding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
          child: Icon(
            FontAwesome.google,
            color: Colors.grey,
          ),
        ),
        Text(
          "Sign in with Google",
          style: TextStyle(color: Colors.black),
        ),
      ],
    ));
