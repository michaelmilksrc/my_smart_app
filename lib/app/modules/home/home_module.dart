import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:my_smart_app/app/modules/home/bloc/home_bloc.dart';
import 'package:my_smart_app/app/modules/home/pages/home_page.dart';
import 'package:my_smart_app/app/modules/home/pages/second_page.dart';
import 'package:my_smart_app/app/shared/auth/repositories/auth_repository.dart';

class HomeModule extends Module {
  @override
  List<Bind> get binds => [
        Bind(
          (i) => HomeBloc(authRepository: Modular.get<AuthRepository>()),
        ),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          Modular.initialRoute,
          child: (_, args) => HomePage(bloc: Modular.get<HomeBloc>()),
        ),
        ChildRoute(
          "/second",
          child: (_, args) => SecondPage(),
          transition: TransitionType.custom,
          customTransition: CustomTransition(
            transitionBuilder: (context, anim1, anim2, child) {
              return FadeTransition(
                opacity: anim1,
                child: child,
              );
            },
          ),
        ),
      ];
}
