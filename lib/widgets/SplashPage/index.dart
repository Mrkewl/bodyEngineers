import 'dart:async';

import 'package:body_engineer/widgets/HomePage/index.dart';
import 'package:body_engineer/widgets/Login/authService.dart';
import 'package:body_engineer/widgets/Login/index.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  Widget build(BuildContext ctx) {
    return FutureBuilder(
        future: AuthService().isAlreadySignedIn(),
        builder: (ctx, AsyncSnapshot<bool> snapshot) {
          if (snapshot.hasData) {
            print(snapshot);
            if (snapshot.data) {
              return HomePage();
            } else {
              return Login();
            }
          }
          return CircularProgressIndicator(
            semanticsLabel: "loading",
          );
        });
  }
}
