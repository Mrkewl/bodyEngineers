import 'package:body_engineer/models/AppState.dart';
import 'package:body_engineer/models/Settings.dart';
import 'package:body_engineer/models/User.dart';

AppState appStateReducer(AppState state, action) {
  return AppState(
    user: userReducer(state.user, action),
    settings: settingsReducer(state.settings, action),
  );
}

User userReducer(User state, action) {
  return state;
}

Settings settingsReducer(Settings state, action) {
  return state;
}
