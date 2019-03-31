import '../models/app_state.dart';
//import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

AppState appReducer(AppState state, action) {
//  if (action is UserLoginAction) {
//    return action.state;
//  }
}

final UserLoginReducer = combineReducers<AuthState>([
  TypedReducer<AuthState, UserLoginAction>(_userLogin),
]);

AuthState _userLogin(AuthState, action) {
  return action.state;
}

class UserLoginAction {
  final AuthState state;

  UserLoginAction(this.state);
}