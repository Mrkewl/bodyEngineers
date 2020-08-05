import 'package:body_engineer/widgets/Login/authService.dart';
import 'package:body_engineer/widgets/Login/index.dart';
import 'package:flutter/material.dart';

final sideDrawer = (BuildContext context) => new Drawer(
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text('Drawer Header'),
            decoration: BoxDecoration(
              color: Colors.grey,
            ),
          ),
          ListTile(
            title: Row(children: <Widget>[
              Icon(Icons.archive),
              Text('My Health Info'),
            ]),
            onTap: () {
              // Update the state of the app
              // ...
              // Then close the drawer
              Navigator.pop(context);
            },
          ),
          ListTile(
            title:
                Row(children: <Widget>[Icon(Icons.settings), Text('Settings')]),
            onTap: () {
              // Update the state of the app
              // ...
              // Then close the drawer
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Row(
                children: <Widget>[Icon(Icons.exit_to_app), Text('Logout')]),
            onTap: () {
              AuthService().authSignOut();
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (BuildContext context) => Login()));
            },
          ),
        ],
      ),
    );
