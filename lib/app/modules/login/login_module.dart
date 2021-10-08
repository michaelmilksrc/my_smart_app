import 'package:flutter_modular/flutter_modular.dart';
import 'package:my_smart_app/app/modules/login/bloc/login_bloc.dart';
import 'package:my_smart_app/app/modules/login/pages/login_page.dart';
import 'package:my_smart_app/app/shared/auth/repositories/auth_repository.dart';

class LoginModule extends Module {
  @override
  final List<Bind> binds = [
    Bind((i) => LoginBloc(authRepository: Modular.get<AuthRepository>())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      Modular.initialRoute,
      child: (_, args) => LoginPage(bloc: Modular.get<LoginBloc>()),
    ),
  ];
}
