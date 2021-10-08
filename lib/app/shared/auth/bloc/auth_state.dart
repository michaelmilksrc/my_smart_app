import 'package:my_smart_app/app/shared/models/user_model.dart';

abstract class AuthState {}

class Logged implements AuthState {
  final UserModel user;
  Logged(this.user);
}

class NotLogged implements AuthState {}
