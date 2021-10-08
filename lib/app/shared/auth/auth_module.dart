import 'package:flutter_modular/flutter_modular.dart';
import 'package:my_smart_app/app/shared/auth/bloc/auth_bloc.dart';
import 'package:my_smart_app/app/shared/auth/pages/auth_page.dart';
import 'package:my_smart_app/app/shared/auth/repositories/auth_repository.dart';

class AuthModule extends Module {
  @override
  final List<Bind> binds = [
    Bind(
      (i) => AuthRepository(),
      export: true,
    ),
    Bind(
      (i) => AuthBloc(authRepository: i.get<AuthRepository>()),
      export: true,
    ),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      Modular.initialRoute,
      child: (_, args) => AuthPage(bloc: Modular.get<AuthBloc>()),
    ),
  ];
}
