import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:my_smart_app/app/shared/auth/repositories/auth_repository.dart';

class AuthGuard extends RouteGuard {
  AuthGuard() : super(redirectTo: '/login/');

  @override
  Future<bool> canActivate(String path, ModularRoute router) async {
    final User? user = await Modular.get<AuthRepository>().getUser();
    bool logged = false;
    if (user != null) {
      logged = true;
    } else {
      logged = false;
    }
    return Future(() => logged);
  }
}
