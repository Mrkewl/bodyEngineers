import 'package:flutter/material.dart';

final applicationBar = () => AppBar(
      centerTitle: true,
      backgroundColor: Colors.black,
      actions: <Widget>[
        Padding(
          padding: const EdgeInsets.only(
              top: 8.0, bottom: 8.0, left: 8.0, right: 86.0),
          child: Center(
            child: Image.asset(
              'lib/assets/images/logo.png',
            ),
          ),
        )
      ],
    );
