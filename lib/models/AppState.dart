import 'package:body_engineer/models/Settings.dart';
import 'package:body_engineer/models/User.dart';

class AppState {
  final User user;
  final Settings settings;
  //constructor
  AppState({
    this.user,
    this.settings,
  });
}
