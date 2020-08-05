import 'package:body_engineer/models/AppState.dart';
import 'package:body_engineer/redux/reducer.dart';
import 'package:body_engineer/themes/index.dart';
import 'package:body_engineer/widgets/HomePage/index.dart';
import 'package:body_engineer/widgets/Login/authService.dart';
import 'package:body_engineer/widgets/Login/index.dart';
import 'package:body_engineer/widgets/SplashPage/index.dart';
import 'package:flutter/material.dart';

import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final Store<AppState> store = Store<AppState>(
      appStateReducer,
      initialState: AppState.initialState(),
    );
    return StoreProvider<AppState>(
      store: store,
      child: MaterialApp(theme: defaultTheme(), home: SplashScreen()),
    );
  }
}
